import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/flexiable_image.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: FlexibleImage(
            source: Assets.assetsImagesIphone,
            height: 150,
            fit: BoxFit.contain,
          ),
        ),
        const Gap(20),
        Text('prod_name_dummy'.tr(), style: TextStyles.blackBold16),
        const Gap(4),
        Text(
          "Green Lion Deludo PC Case",
          style: TextStyles.blackRegular12.copyWith(color: Colors.grey.shade600),
        ),
        const Gap(10),
        Text('prod_price_dummy'.tr(), style: TextStyles.blackBold16.copyWith(color: AppColors.primaryColor)),
        const Gap(20),
        Text('product_description'.tr(), style: TextStyles.blackBold14),
        const Gap(10),
        Text(
          'cart_prod_description'.tr(),
          style: TextStyles.blackRegular12.copyWith(height: 1.5),
        ),
        const Gap(20),
        Text('main_features'.tr(), style: TextStyles.blackBold14),
        const Gap(10),
        _buildBulletPoint('cart_prod_feature_1'.tr()),
        _buildBulletPoint('cart_prod_feature_2'.tr()),
        _buildBulletPoint('cart_prod_feature_3'.tr()),
        _buildBulletPoint('cart_prod_feature_4'.tr()),
        _buildBulletPoint('cart_prod_feature_5'.tr()),
        const Gap(40),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0, left: 8.0),
            child: CircleAvatar(radius: 3, backgroundColor: Colors.black),
          ),
          Expanded(
            child: Text(text, style: TextStyles.blackRegular12.copyWith(height: 1.5)),
          ),
        ],
      ),
    );
  }
}
