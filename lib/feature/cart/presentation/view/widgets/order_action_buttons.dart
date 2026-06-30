import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:waffar/core/router/app_router.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/theme/text_styles.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 45,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text('continue_shopping'.tr(), style: TextStyles.blackBold14),
          ),
        ),
        const Gap(10),
        SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              context.push(AppRouter.shippingDetailsScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text('complete_order'.tr(), style: TextStyles.whiteBold14),
          ),
        ),
        const Gap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shield_outlined, color: Colors.green, size: 20),
            const Gap(5),
            Text(
              'secure_payment'.tr(),
              style: TextStyles.blackRegular12.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              'free_return_14_days'.tr(),
              style: TextStyles.blackRegular12.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
