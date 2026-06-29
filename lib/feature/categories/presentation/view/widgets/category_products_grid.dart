import 'package:flutter/material.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/flexiable_image.dart';

class CategoryProductsGrid extends StatelessWidget {
  const CategoryProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.65,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.favorite_border, size: 16, color: AppColors.primaryColor),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FlexibleImage(
                    source: Assets.assetsImagesIphone,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "سكوترات كهربائية للاطفال تكتك",
                  textAlign: TextAlign.center,
                  style: TextStyles.blackRegular12.copyWith(fontSize: 10),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
