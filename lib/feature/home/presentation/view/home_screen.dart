import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:waffar/core/common_widget/label.dart';
import 'package:waffar/core/extension/context_extension.dart';
import 'package:waffar/core/router/app_router.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/app_bar_custom.dart';
import 'package:waffar/core/widget/carousel_slider_widget.dart';
import 'package:waffar/core/widget/category_grid_widget.dart';
import 'package:waffar/core/widget/custom_text_field.dart';
import 'package:waffar/core/widget/flexiable_image.dart';
import 'package:waffar/feature/home/presentation/view/widgets/personal_care_items.dart';
import 'package:waffar/feature/home/presentation/view/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  final List<CategoryItem> categories = const [
    CategoryItem(image: Assets.assetsImagesBanners3),
    CategoryItem(image: Assets.assetsImagesBanners3),
    CategoryItem(image: Assets.assetsImagesBanners3),
    CategoryItem(image: Assets.assetsImagesBanners3),
  ];
  final List<PersonalCareItem> personalCareItems = const [
    PersonalCareItem(
      image: Assets.assetsImagesEstshwar, // غير بالصور بتاعتك
      title: "حلاقة الجسم",
    ),
    PersonalCareItem(image: Assets.assetsImagesEstshwar, title: "استشوارات"),
    PersonalCareItem(image: Assets.assetsImagesEstshwar, title: "استشوارات"),
    PersonalCareItem(image: Assets.assetsImagesEstshwar, title: "استشوارات"),
    PersonalCareItem(image: Assets.assetsImagesEstshwar, title: "استشوارات"),
    PersonalCareItem(image: Assets.assetsImagesEstshwar, title: "استشوارات"),
    PersonalCareItem(
      image: Assets.assetsImagesEstshwar,
      title: "سيراميك الشعر",
    ),
    PersonalCareItem(
      image: Assets.assetsImagesEstshwar,
      title: "ليزر إزالة شعر",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarCustom(isLogoEnabled: true),
                // Gap(10),
                CarouselSliderWidget(
                  height: context.screenHeight * 0.25,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  widgets: [
                    FlexibleImage(source: Assets.assetsImagesBanners1),
                    FlexibleImage(source: Assets.assetsImagesBanners1),
                    FlexibleImage(source: Assets.assetsImagesBanners1),
                  ],
                ),
                FlexibleImage(
                  source: Assets.assetsImagesBanner2,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  height: context.screenHeight * 0.15,
                ),
                CategoryGridWidget(items: categories),
                const Gap(20),
                categoryWidget(context),
                const Gap(20),
                LocalizedLabel(
                  text: "categories_everyone_searching",
                  style: TextStyles.blackBold20,
                ),
                const Gap(15),
                categoriesEveryoneSearching(context),
                const Gap(20),
                LocalizedLabel(
                  text: "featured_products",
                  style: TextStyles.blackBold20,
                ),
                const Gap(15),
                featuredProducts(context),
                const Gap(20),
                personalCareWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container personalCareWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.homeBGColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocalizedLabel(
                  text: "personalCare",
                  style: TextStyles.blackBold20,
                ),
                viewMoreButton(),
              ],
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // مهم عشان يكون داخل SingleChildScrollView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 في كل صف
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75, // تعديل حسب احتياجك (ارتفاع vs عرض)
                ),
                itemCount: personalCareItems.length,
                itemBuilder: (context, index) {
                  final item = personalCareItems[index];
                  return _buildCareCard(item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector viewMoreButton() {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.black, width: 1),
          // borderRadius: BorderRadius.circular(20),
        ),
        child: LocalizedLabel(text: "view_more", style: TextStyles.blackBold14),
      ),
    );
  }

  Widget _buildCareCard(PersonalCareItem item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlexibleImage(source: item.image, fit: BoxFit.contain),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyles.blackBold14.copyWith(fontSize: 13, height: 1.3),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView featuredProducts(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: ProductWidget(
              onTap: () {
                context.push(AppRouter.productDetailsScreen);
              },
              image: Assets.assetsImagesTv,
              name: 'Product 1',
              price: '100\$',
              discountPrice: '80\$',
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView categoriesEveryoneSearching(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: ProductWidget(
              onTap: () {
                context.push(AppRouter.productDetailsScreen);
              },
              image: Assets.assetsImagesTv,
              name: 'Product 1',
              price: '100\$',
              discountPrice: '80\$',
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView categoryWidget(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                context.push(AppRouter.subCategoryScreen);
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: FlexibleImage(
                      source: Assets.assetsIconsApple,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Gap(5),
                  Text('Category ${index + 1}', style: TextStyles.blackBold14),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
