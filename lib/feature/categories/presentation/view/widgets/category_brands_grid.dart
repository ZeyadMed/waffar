import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/flexiable_image.dart';

class CategoryBrandsGrid extends StatelessWidget {
  const CategoryBrandsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Center(
                child: FlexibleImage(
                  source: Assets.assetsImagesTv,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Gap(5),
            Text(
              "شاومي",
              style: TextStyles.blackRegular12,
            ),
          ],
        );
      },
    );
  }
}
