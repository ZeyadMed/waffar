import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

import 'helper.dart';

/// Result of trying to gain access to the device location.
enum LocationAccess { granted, serviceDisabled, denied, deniedForever }

class LocationService {
  // Check if location services are enabled on the device
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// Checks GPS service + permission in one call so callers can show the right
  /// prompt (turn on GPS / grant permission / open settings) instead of a
  /// generic failure.
  Future<LocationAccess> ensureLocationAccess() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return LocationAccess.serviceDisabled;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return LocationAccess.deniedForever;
    }
    if (permission == LocationPermission.denied) {
      return LocationAccess.denied;
    }
    return LocationAccess.granted;
  }

  // Check current permission status
  Future<LocationPermission> checkPermissions() async {
    return await Geolocator.checkPermission();
  }

  // Request location permissions
  Future<LocationPermission> requestPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    
    return permission;
  }

  // Get current location (one-time)
  Future<LatLng?> getCurrentLocation() async {
    try {
      // Check if service is enabled
      bool serviceEnabled = await isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled');
      }

      // Check permissions
      LocationPermission permission = await checkPermissions();
      if (permission == LocationPermission.denied) {
        permission = await requestPermissions();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are denied');
      }

      // Get position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
        ),
      );

      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      debugPrint('Error getting location: $e');
      return null;
    }
  }

  // Get address from coordinates with locale support
  Future<Map<String, String?>> getAddressFromCoordinates(
    LatLng coordinates, {
    String? localeIdentifier,
  }) async {
    try {
      // Set locale before geocoding if provided
      if (localeIdentifier != null) {
        await setLocaleIdentifier(localeIdentifier);
      }
      
      List<Placemark> placemarks = await placemarkFromCoordinates(
        coordinates.latitude,
        coordinates.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        
        // Build address with street, district, area, and governorate (without building numbers)
        List<String> addressParts = [];
        String? streetName;
        
        // Add street name if available (without numbers)
        if (place.street != null && place.street!.isNotEmpty) {
          // Remove numbers from street name
          streetName = place.street!.replaceAll(RegExp(r'\d+'), '').trim();
          // Remove extra spaces and commas
          streetName = streetName.replaceAll(RegExp(r'\s+'), ' ').replaceAll(RegExp(r'^[,\s]+|[,\s]+$'), '');
          if (streetName.isNotEmpty) {
            addressParts.add(streetName);
          }
        }
        
        // Add subLocality (district/neighborhood) if available
        if (place.subLocality != null && place.subLocality!.isNotEmpty) {
          addressParts.add(place.subLocality!);
        }
        
        // Add locality (area/city) if available
        if (place.locality != null && place.locality!.isNotEmpty) {
          addressParts.add(place.locality!);
        }
        
        // Add administrativeArea (governorate/state) if available
        if (place.administrativeArea != null && place.administrativeArea!.isNotEmpty) {
          addressParts.add(place.administrativeArea!);
        }
        
        String fullAddress;
        // If we have address parts, join them; otherwise show locality or country
        if (addressParts.isNotEmpty) {
          fullAddress = addressParts.join(', ');
        } else if (place.locality != null && place.locality!.isNotEmpty) {
          fullAddress = place.locality!;
        } else if (place.country != null && place.country!.isNotEmpty) {
          fullAddress = place.country!;
        } else {
          fullAddress = 'unknown_location';
        }

        return {
          'fullAddress': fullAddress,
          'districtName': place.subLocality ?? place.locality,
          'regionName': place.administrativeArea ?? place.locality,
          'streetName': streetName,
        };
      }
      return {};
    } catch (e) {
      debugPrint('Error getting address: $e');
      return {};
    }
  }



  // Open location (GPS) settings
  Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  // Open app settings (for permission management)
  Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }
}
