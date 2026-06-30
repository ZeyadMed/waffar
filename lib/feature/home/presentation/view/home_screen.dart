import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/common_widget/label.dart';
import 'package:waffar/core/extension/context_extension.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/app_bar_custom.dart';
import 'package:waffar/core/widget/carousel_slider_widget.dart';
import 'package:waffar/core/widget/category_grid_widget.dart';
import 'package:waffar/core/widget/flexiable_image.dart';
import 'package:waffar/feature/home/presentation/view/widgets/home_category_scroll_widget.dart';
import 'package:waffar/feature/home/presentation/view/widgets/home_everyone_searching_widget.dart';
import 'package:waffar/feature/home/presentation/view/widgets/home_featured_products_widget.dart';
import 'package:waffar/feature/home/presentation/view/widgets/home_personal_care_section_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  final List<CategoryItem> categories = const [
    CategoryItem(image: Assets.assetsImagesBanners3),
    CategoryItem(image: Assets.assetsImagesBanners3),
    CategoryItem(image: Assets.assetsImagesBanners3),
    CategoryItem(image: Assets.assetsImagesBanners3),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarCustom(isLogoEnabled: true),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: CarouselSliderWidget(
                  height: context.screenHeight * 0.25,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  widgets: [
                    FlexibleImage(source: Assets.assetsImagesBanners1),
                    FlexibleImage(source: Assets.assetsImagesBanners1),
                    FlexibleImage(source: Assets.assetsImagesBanners1),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: FlexibleImage(
                  source: Assets.assetsImagesBanner2,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  height: context.screenHeight * 0.15,
                ),
              ),
              CategoryGridWidget(items: categories),
              const Gap(20),
              const HomeCategoryScrollWidget(),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: LocalizedLabel(
                  text: "categories_everyone_searching",
                  style: TextStyles.blackBold20,
                ),
              ),
              const Gap(15),
              const HomeEveryoneSearchingWidget(),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: LocalizedLabel(
                  text: "featured_products",
                  style: TextStyles.blackBold20,
                ),
              ),
              const Gap(15),
              const HomeFeaturedProductsWidget(),
              const Gap(20),
              const HomePersonalCareSectionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
