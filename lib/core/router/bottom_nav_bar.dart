import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waffar/core/router/bottom_nav_center_button.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/theme/text_styles.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  static const _items = <_NavItem>[
    _NavItem(
      labelKey: 'home',
      unselectedIcon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
    ),
    _NavItem(
      labelKey: 'category',
      unselectedIcon: Icons.grid_view_outlined,
      selectedIcon: Icons.grid_view_rounded,
    ),
    _NavItem(
      labelKey: '',
      unselectedIcon: Icons.public,
      selectedIcon: Icons.public,
    ),
    _NavItem(
      labelKey: 'cart',
      unselectedIcon: Icons.shopping_cart_outlined,
      selectedIcon: Icons.shopping_cart_rounded,
    ),
    _NavItem(
      labelKey: 'profile',
      unselectedIcon: Icons.person_outline_rounded,
      selectedIcon: Icons.person_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final navBarColor = isDark ? const Color(0xFF111827) : AppColors.whiteColor;
    final selectedColor = isDark
        ? const Color(0xFF8EA2FF)
        : AppColors.primaryColor;
    final unselectedColor = isDark
        ? const Color(0xFF8B95AA)
        : AppColors.greyColor;

    return Container(
      decoration: BoxDecoration(
        color: navBarColor,
        border: Border(
          top: BorderSide(
            color: isDark ? Colors.white12 : const Color(0xFFE8ECF3),
          ),
        ),
      ),
      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 4.h, bottom: 2.h),
      child: SafeArea(
        top: false,
        child: Row(
          children: List.generate(_items.length, (i) {
            if (i == 2) {
              return BottomNavCenterButton(
                icon: _items[i].selectedIcon,
                labelKey: _items[i].labelKey,
                onTap: () => onItemTapped(i),
              );
            }
            final item = _items[i];
            final isSelected = selectedIndex == i;
            return Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onItemTapped(i),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isSelected ? item.selectedIcon : item.unselectedIcon,
                        size: 24.sp,
                        color: isSelected ? selectedColor : unselectedColor,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        item.labelKey.tr(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.blackBold14.copyWith(
                          fontSize: 11.sp,
                          color: isSelected ? selectedColor : unselectedColor,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final String labelKey;
  final IconData unselectedIcon;
  final IconData selectedIcon;

  const _NavItem({
    required this.labelKey,
    required this.unselectedIcon,
    required this.selectedIcon,
  });
}
