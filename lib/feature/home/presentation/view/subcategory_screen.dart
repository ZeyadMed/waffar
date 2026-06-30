import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:waffar/core/common_widget/label.dart';
import 'package:waffar/core/router/app_router.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/app_bar_custom.dart';
import 'package:waffar/core/widget/drop_down.dart';
import 'package:waffar/feature/home/presentation/view/widgets/product_widget.dart';

class SubcategoryScreen extends StatefulWidget {
  const SubcategoryScreen({super.key});

  @override
  State<SubcategoryScreen> createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  String? _selectedFilter;
  String? _selectedSort;

  final List<String> _filterOptions = ['all', 'available_filter', 'unavailable_filter'];
  final List<String> _sortOptions = [
    'most_relevant',
    'sort_highest_price',
    'sort_lowest_price',
  ];

  final List<Map<String, dynamic>> _quickFilters = [
    {'label': 'warranty_filter', 'icon': Icons.settings_outlined},
    {'label': 'fast_delivery_title', 'icon': Icons.local_shipping_outlined},
    {'label': 'pay_on_delivery', 'icon': Icons.crop_square_outlined},
    {'label': 'installment_filter', 'icon': Icons.crop_square_outlined},
  ];
  final Set<String> _activeFilters = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarCustom(isLogoEnabled: false),
              fillterMethod(),
              subcategoryMethod(),
              Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: LocalizedLabel(
                  text: "best_sellers",
                  style: TextStyles.blackBold16.copyWith(fontSize: 20),
                ),
              ),
              Gap(10),
              bestSellerMethod(),
              Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: LocalizedLabel(
                  text: "new_arrivals",
                  style: TextStyles.blackBold16.copyWith(fontSize: 20),
                ),
              ),
              Gap(10),
              newArrivalsMethod(),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView bestSellerMethod() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ProductWidget(
              onTap: () {
                context.push(AppRouter.productDetailsScreen);
              },
              image: Assets.assetsImagesEstshwar,
              name: 'Product $index',
              price: "100.0",
              discountPrice: "80.0",
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView newArrivalsMethod() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            child: ProductWidget(
              onTap: () {
                context.push(AppRouter.productDetailsScreen);
              },
              image: Assets.assetsImagesEstshwar,
              name: 'Product $index',
              price: "100.0",
              discountPrice: "80.0",
            ),
          ),
        ),
      ),
    );
  }

  Padding fillterMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomDropDown<String>(
              value: _selectedSort,
              items: _sortOptions,
              getLabel: (item) => item.tr(),
              hint: 'most_relevant'.tr(),
              onChanged: (val) => setState(() => _selectedSort = val),
            ),
          ),
          Gap(10),
          Expanded(
            child: CustomDropDown<String>(
              value: _selectedFilter,
              items: _filterOptions,
              getLabel: (item) => item.tr(),
              hint: 'filters'.tr(),
              onChanged: (val) => setState(() => _selectedFilter = val),
            ),
          ),
        ],
      ),
    );
  }

  Padding subcategoryMethod() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('cat_tv_name'.tr(), style: TextStyles.blackBold16),
                Gap(5),
                Text(
                  'products_available'.tr(),
                  style: TextStyles.blackBold14.copyWith(color: Colors.grey),
                ),
              ],
            ),
            Gap(10),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.redColor2.withValues(alpha: 0.1),
              ),
              child: Text(
                'fast_shipping_percent'.tr(),
                style: TextStyles.blackBold14.copyWith(
                  color: AppColors.redColor2,
                ),
              ),
            ),
            Gap(5),
            Divider(color: Colors.grey.shade300, thickness: 1),
            Gap(5),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 5.5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: _quickFilters.map((filter) {
                final label = filter['label'] as String;
                final icon = filter['icon'] as IconData;
                final isActive = _activeFilters.contains(label);
                return GestureDetector(
                  onTap: () => setState(() {
                    if (isActive) {
                      _activeFilters.remove(label);
                    } else {
                      _activeFilters.add(label);
                    }
                  }),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(icon, size: 18, color: AppColors.redColor2),
                      Gap(10),
                      Text(label.tr(), style: TextStyles.blackBold14),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
