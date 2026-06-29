import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
            child: Text("متابعة التسوق", style: TextStyles.blackBold14),
          ),
        ),
        const Gap(10),
        SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text("أكمل الطلب", style: TextStyles.whiteBold14),
          ),
        ),
        const Gap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shield_outlined, color: Colors.green, size: 20),
            const Gap(5),
            Text(
              "دفع آمن",
              style: TextStyles.blackRegular12
                  .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              "ارجاع مجاني خلال 14 يوم",
              style: TextStyles.blackRegular12.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
