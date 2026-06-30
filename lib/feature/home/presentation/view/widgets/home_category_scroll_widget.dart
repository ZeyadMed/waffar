import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:waffar/core/router/app_router.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/flexiable_image.dart';

class HomeCategoryScrollWidget extends StatelessWidget {
  const HomeCategoryScrollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () => context.push(AppRouter.subCategoryScreen),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.5),
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
                  const Gap(5),
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
