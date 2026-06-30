import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/helper/helper.dart';
import 'package:waffar/core/theme/text_styles.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'prod_name_iphone'.tr(),
            style: TextStyles.blackBold16,
            textAlign: TextAlign.right,
          ),
          const Gap(4),
          Text('Green Lion Delado Pc Case', style: TextStyles.greyRegular15),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'prod_price_main'.tr(),
                    style: TextStyles.blackBold20.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    'prod_price_original'.tr(),
                    style: TextStyles.greyRegular15.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.lightTextColor,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.redColor2.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'discount_17'.tr(),
                  style: TextStyles.darkBold12.copyWith(color: AppColors.redColor2),
                ),
              ),
            ],
          ),
          const Gap(6),
          Text(
            'save_11'.tr(),
            style: TextStyles.darkBold12.copyWith(color: AppColors.redColor2),
          ),
        ],
      ),
    );
  }
}
