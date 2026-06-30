import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/helper/helper.dart';
import 'package:waffar/core/theme/text_styles.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({super.key});

  static const _bullets = [
    'prod_feature_1',
    'prod_feature_2',
    'prod_feature_3',
    'prod_feature_4',
    'prod_feature_5',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('product_description'.tr(), style: TextStyles.blackBold16),
          const Gap(8),
          Text(
            'prod_description_text'.tr(),
            style: TextStyles.greyRegular15,
            textAlign: TextAlign.right,
          ),
          const Gap(12),
          Text('prod_features_title'.tr(), style: TextStyles.blackBold14),
          const Gap(8),
          ..._bullets.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 7),
                    child: Icon(Icons.circle, size: 6, color: Colors.black54),
                  ),
                  Gap(5),
                  Expanded(
                    child: Text(
                      p.tr(),
                      style: TextStyles.greyRegular15,
                      textAlign: TextAlign.right,
                    ),
                  ),

                 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
