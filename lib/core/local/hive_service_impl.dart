import 'package:hive_flutter/hive_flutter.dart';
import 'package:waffar/core/local/cache_theme.dart';
import '../helper/logger.dart';
part 'user_cache_interface.dart';
part 'paginated_cache_interface.dart';

class HiveServiceImpl implements IUserCache, IThemeCache {
  static const String userBoxName = 'user_box';
  // static Box<CustomerModel>? _userBox;
  static const String currentUserKey = 'current_user';
  static const String orderBoxName = 'order_box';
  static Box<String>? _orderBox;
  static const String selectedAreaBoxName = 'selected_area_box';
  // static Box<AreasModel>? _selectedAreaBox;
  static const String locationBoxName = 'location_box';
  static Box<Map>? _locationBox;
  static const String selectedLocationKey = 'selected_location';
  static const String settingsBoxName = 'settings_box';
  static Box? _settingsBox;
  HiveServiceImpl._();

  static final HiveServiceImpl instance = HiveServiceImpl._();

  static Future<void> init() async {
    await Hive.initFlutter();
    // Hive.registerAdapter(CustomerModelAdapter());
    // Hive.registerAdapter(ItemModelAdapter());
    // Hive.registerAdapter(AreasModelAdapter());

    // _userBox = await Hive.openBox<CustomerModel>(userBoxName);
    _orderBox = await Hive.openBox<String>(orderBoxName);
    // _selectedAreaBox = await Hive.openBox<AreasModel>(selectedAreaBoxName);
    _locationBox = await Hive.openBox<Map>(locationBoxName);
    _settingsBox = await Hive.openBox(settingsBoxName);
  }

  // @override
  // Future<void> cacheUserModel(CustomerModel user) async {
  //   await _userBox?.put(currentUserKey, user);
  // }

  @override
  Map<String, dynamic>? getLocation() {
    final data = _locationBox?.get(selectedLocationKey);
    return data?.cast<String, dynamic>();
  }

  static const String profileImageKey = 'profile_image';
  static const String firstLaunchDateKey = 'first_launch_date';
  static const String lastOrderDateKey = 'last_order_date';

  @override
  Future<void> saveProfileImage(String path) async {
    await _settingsBox?.put(profileImageKey, path);
    logger('Saved profile image path to cache: $path');
  }

  @override
  String? getProfileImage() {
    return _settingsBox?.get(profileImageKey);
  }

  @override
  Future<void> saveFirstLaunchDate() async {
    // Only store once — never overwrite.
    if (_settingsBox?.get(firstLaunchDateKey) != null) return;
    await _settingsBox?.put(
      firstLaunchDateKey,
      DateTime.now().toIso8601String(),
    );
    logger('First launch date saved.');
  }

  @override
  DateTime? getFirstLaunchDate() {
    final raw = _settingsBox?.get(firstLaunchDateKey) as String?;
    return raw != null ? DateTime.tryParse(raw) : null;
  }

  @override
  Future<void> saveLastOrderDate() async {
    await _settingsBox?.put(lastOrderDateKey, DateTime.now().toIso8601String());
    logger('Last order date updated.');
  }

  @override
  DateTime? getLastOrderDate() {
    final raw = _settingsBox?.get(lastOrderDateKey) as String?;
    return raw != null ? DateTime.tryParse(raw) : null;
  }

  @override
  bool shouldHidePrice() {
    final firstLaunch = getFirstLaunchDate();
    if (firstLaunch == null) return false;

    final now = DateTime.now();
    final daysSinceFirstLaunch = now.difference(firstLaunch).inDays;
    if (daysSinceFirstLaunch < 45) return false;

    // If the customer placed an order within the last 45 days, show price.
    final lastOrder = getLastOrderDate();
    if (lastOrder != null && now.difference(lastOrder).inDays < 45) {
      return false;
    }

    return true;
  }

  // @override
  // CustomerModel? getUserModel() {
  //   final user = _userBox?.get(currentUserKey);
  //   if (user != null) {
  //   }
  //   return user;
  // }

  // @override
  // Future<void> clearUserModel() async {
  //   await _userBox?.delete(currentUserKey);
  // }

  // @override
  // Future updateCachedUserModel(CustomerModel user) async {
  //   await _userBox?.put(currentUserKey, user);
  //   logger('Updated user in cache: ${user.toJson()}');
  // }

  Future<void> _cachePage<T>(List<T> items, {String? cacheKey}) async {
    final box = await Hive.openBox<T>(cacheKey!);
    await box.putAll(items.asMap());
  }

  Future<List<T>> _getCachedPage<T>({String? cacheKey}) {
    throw UnimplementedError();
  }

  @override
  Future<void> cacheOrderId(String orderId) async {
    await _orderBox?.put('current_order_id', orderId);
  }

  @override
  Future<void> upDateOrderId(String orderId) async {
    await _orderBox?.put('current_order_id', orderId);
  }

  @override
  String? getOrderId() {
    return _orderBox?.get('current_order_id');
  }

  // New methods for delivery addition
  static const String deliveryAdditionKey = 'delivery_addition';

  // Future<void> cacheDeliveryAddition(AreasModel area) async {
  //   await _selectedAreaBox?.put(deliveryAdditionKey, area);
  //   logger('Cached delivery addition area: ${area.districtName}');
  // }

  // AreasModel? getDeliveryAddition() {
  //   return _selectedAreaBox?.get(deliveryAdditionKey);
  // }

  // Future<void> clearDeliveryAddition() async {
  //   await _selectedAreaBox?.delete(deliveryAdditionKey);
  // }

  @override
  Future<void> saveLocation({
    required String address,
    String? districtName,
    String? regionName,
    String? addressNotes,
    double? latitude,
    double? longitude,
  }) async {
    await _locationBox?.put(selectedLocationKey, {
      'address': address,
      'districtName': districtName,
      'regionName': regionName,
      'addressNotes': addressNotes,
      'latitude': latitude,
      'longitude': longitude,
    });
    logger('Saved location to cache: $districtName, $regionName');
  }

  static const String deliveryOptionKey = 'delivery_option';
  static const String deliveryTimeKey = 'delivery_time';
  static const String topModeKey = 'top_mode';
  static const String pickupSelectionKey = 'pickup_selection';

  @override
  Future<void> saveDeliveryOption(String option) async {
    await _settingsBox?.put(deliveryOptionKey, option);
  }

  @override
  String? getDeliveryOption() {
    return _settingsBox?.get(deliveryOptionKey);
  }

  @override
  Future<void> saveDeliveryTime(Map<String, String> details) async {
    await _settingsBox?.put(deliveryTimeKey, details);
  }

  @override
  Map<String, String>? getDeliveryTime() {
    final data = _settingsBox?.get(deliveryTimeKey);
    return data != null ? Map<String, String>.from(data) : null;
  }

  @override
  Future<void> saveTopMode(String mode) async {
    await _settingsBox?.put(topModeKey, mode);
  }

  @override
  String? getTopMode() {
    return _settingsBox?.get(topModeKey);
  }

  @override
  Future<void> savePickupSelection(Map<String, String> details) async {
    await _settingsBox?.put(pickupSelectionKey, details);
  }

  @override
  Map<String, String>? getPickupSelection() {
    final data = _settingsBox?.get(pickupSelectionKey);
    return data != null ? Map<String, String>.from(data) : null;
  }

  // ---- Theme mode persistence (IThemeCache) ----
  static const String themeModeKey = 'theme_mode';

  @override
  Future<void> saveThemeMode(String themeMode) async {
    await _settingsBox?.put(themeModeKey, themeMode);
    logger('Saved theme mode: $themeMode');
  }

  @override
  String? getThemeMode() {
    return _settingsBox?.get(themeModeKey) as String?;
  }

  @override
  Future<void> clearThemeMode() async {
    await _settingsBox?.delete(themeModeKey);
  }
}
