import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waffar/core/common_widget/custom_error_message.dart';
import 'package:waffar/core/router/bottom_nav_bar.dart';
import 'package:waffar/core/service_locator/service_locator.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/widget/store_switcher_bottom_sheet.dart';
import 'package:waffar/feature/cart/presentation/view/cart_screen.dart';
import 'package:waffar/feature/categories/presentation/view/categories_screen.dart';
import 'package:waffar/feature/home/presentation/view/home_screen.dart';
import 'package:waffar/feature/profile/presentation/view/profile_screen.dart';

class BottomNavApp extends StatefulWidget {
  const BottomNavApp({super.key});

  @override
  State<BottomNavApp> createState() => _BottomNavAppState();
}

class _BottomNavAppState extends State<BottomNavApp> {
  int _selectedIndex = 0;
  DateTime? _lastBackPressed;
  final Map<int, Widget> _cachedPages = {};

  @override
  void initState() {
    getIt<Dio>().options.headers['Accept-Language'] = 'ar';
    super.initState();
    _getPage(0);
  }

  Widget _getPage(int index) {
    if (_cachedPages.containsKey(index)) return _cachedPages[index]!;

    final Widget page = switch (index) {
      0 => HomeScreen(),
      1 => const CategoriesScreen(),
      2 => const SizedBox.shrink(),
      3 => const CartScreen(),
      4 => const ProfileScreen(),
      _ => const SizedBox.shrink(),
    };

    _cachedPages[index] = page;
    return page;
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      StoreSwitcherBottomSheet.show(context);
      return;
    }
    setState(() {
      _selectedIndex = index;
      _getPage(index);
    });
  }

  Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      setState(() => _selectedIndex = 0);
      return false;
    }
    final now = DateTime.now();
    if (_lastBackPressed == null ||
        now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
      _lastBackPressed = now;
      CustomErrorOverlay.show(context: context, text: "pressAgain".tr());
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final scaffoldColor = isDark ? const Color(0xFF111827) : AppColors.backgroundColor;

    final children = List.generate(
      5,
      (i) => _cachedPages[i] ?? const SizedBox.shrink(),
    );

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: IndexedStack(index: _selectedIndex, children: children),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
