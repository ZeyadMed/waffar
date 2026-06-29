import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/widget/flexiable_image.dart';

class FreeDeliverySuggestionsWidget extends StatelessWidget {
  final VoidCallback onProductTap;
  const FreeDeliverySuggestionsWidget({super.key, required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("فرصة للحصول علي توصيل مجاني", style: TextStyles.blackBold14),
          const Gap(4),
          Text(
            "قم باضافة اي منتج من المنتجات التالية للحصول\nعلي توصيل مجاني",
            textAlign: TextAlign.center,
            style: TextStyles.blackRegular12.copyWith(color: Colors.grey.shade600, height: 1.5),
          ),
          const Gap(16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: onProductTap,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite_border,
                              size: 18, color: AppColors.primaryColor),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: FlexibleImage(
                            source: Assets.assetsImagesIphone,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "سكوترات كهربائية للاطفال تكتك",
                              textAlign: TextAlign.center,
                              style: TextStyles.blackBold12,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Gap(4),
                            Text(
                              "499 د.أ",
                              style: TextStyles.blackBold14.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "عرض التفاصيل",
                                style: TextStyles.blackRegular12.copyWith(color: Colors.grey, fontSize: 10),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                "اضافة",
                                style: TextStyles.whiteText(10),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
