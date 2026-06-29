part of "hive_service_impl.dart";
abstract interface class IUserCache {
  Future<void> cacheOrderId(String orderId);
  Future<void> upDateOrderId(String orderId);
  String? getOrderId();
  Future<void> saveLocation({
    required String address,
    String? districtName,
    String? regionName,
    String? addressNotes,
    double? latitude,
    double? longitude,
  });
  Map<String, dynamic>? getLocation();
  Future<void> saveProfileImage(String path);
  String? getProfileImage();

  /// Saves the very first time the app was opened (called once on launch).
  Future<void> saveFirstLaunchDate();
  DateTime? getFirstLaunchDate();

  /// Saves/updates the timestamp of the last successful order.
  Future<void> saveLastOrderDate();
  DateTime? getLastOrderDate();

  /// Returns true when 45+ days have passed since first launch
  /// AND the customer has never placed an order (or last order was > 45 days ago).
  bool shouldHidePrice();
  Future<void> saveDeliveryOption(String option);
  String? getDeliveryOption();
  Future<void> saveDeliveryTime(Map<String, String> details);
  Map<String, String>? getDeliveryTime();

  /// Top header mode on the home screen: "delivery" or "pickup".
  Future<void> saveTopMode(String mode);
  String? getTopMode();

  /// In-store pickup selection: {'mode': 'quick'|'later', 'date': 'yyyy-MM-dd'}.
  Future<void> savePickupSelection(Map<String, String> details);
  Map<String, String>? getPickupSelection();
}

