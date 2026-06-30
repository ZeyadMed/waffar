import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/common_widget/label.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/app_bar_custom.dart';
import 'package:waffar/feature/categories/presentation/view/widgets/category_brands_grid.dart';
import 'package:waffar/feature/categories/presentation/view/widgets/category_products_grid.dart';
import 'package:waffar/feature/categories/presentation/view/widgets/category_sidebar.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _selectedCategoryIndex = 0;

  List<String> get _mainCategories => [
    'cat_electronics'.tr(),
    'cat_mobile'.tr(),
    'cat_personal_care_label'.tr(),
    'cat_tv'.tr(),
    'cat_kitchen'.tr(),
    'cat_coffee'.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppBarCustom(isLogoEnabled: false),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: CategorySidebar(
                      categories: _mainCategories,
                      selectedIndex: _selectedCategoryIndex,
                      onSelect: (index) =>
                          setState(() => _selectedCategoryIndex = index),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CategoryProductsGrid(),
                            const Gap(20),
                            LocalizedLabel(
                              text: 'best_brands',
                              style: TextStyles.blackBold16,
                            ),
                            const Gap(15),
                            const CategoryBrandsGrid(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
