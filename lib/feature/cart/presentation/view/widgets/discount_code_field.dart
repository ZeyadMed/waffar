import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/theme/text_styles.dart';

class DiscountCodeField extends StatelessWidget {
  const DiscountCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "اضافة كود الخصم",
          style: TextStyles.blackRegular12.copyWith(color: AppColors.primaryColor),
        ),
        const Gap(8),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'ادخل الكود',
                    hintStyle: TextStyles.blackRegular12.copyWith(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(10),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text("تفعيل", style: TextStyles.whiteBold14),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
