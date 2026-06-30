import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/common_widget/label.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/feature/home/presentation/view/widgets/home_care_card_widget.dart';
import 'package:waffar/feature/home/presentation/view/widgets/personal_care_items.dart';

class HomePersonalCareSectionWidget extends StatelessWidget {
  const HomePersonalCareSectionWidget({super.key});

  static const _items = <PersonalCareItem>[
    PersonalCareItem(image: Assets.assetsImagesEstshwar, title: "care_body_shaving"),
    PersonalCareItem(image: Assets.assetsImagesEstshwar, title: "care_hair_dryer"),
    PersonalCareItem(image: Assets.assetsImagesEstshwar, title: "care_hair_dryer"),
    PersonalCareItem(image: Assets.assetsImagesEstshwar, title: "care_hair_dryer"),
    PersonalCareItem(image: Assets.assetsImagesEstshwar, title: "care_hair_dryer"),
    PersonalCareItem(image: Assets.assetsImagesEstshwar, title: "care_hair_dryer"),
    PersonalCareItem(image: Assets.assetsImagesEstshwar, title: "care_ceramic"),
    PersonalCareItem(image: Assets.assetsImagesEstshwar, title: "care_laser"),
  ];

  @override
  Widget build(BuildContext context) {
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
                LocalizedLabel(text: "personalCare", style: TextStyles.blackBold20),
                const _ViewMoreButton(),
              ],
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: _items.length,
                itemBuilder: (_, index) => HomeCareCardWidget(item: _items[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ViewMoreButton extends StatelessWidget {
  const _ViewMoreButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: LocalizedLabel(text: "view_more", style: TextStyles.blackBold14),
      ),
    );
  }
}
