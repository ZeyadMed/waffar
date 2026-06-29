import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/theme/text_styles.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ملخص الطلب", style: TextStyles.blackBold16),
          const Gap(10),
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
                  child: Text(
                    "تفعيل",
                    style: TextStyles.whiteBold14,
                  ),
                ),
              ),
            ],
          ),
          const Gap(20),
          _buildSummaryRow("المجموع", "499 د.أ"),
          const Gap(10),
          _buildSummaryRow("الخصم", "0 د.أ"),
          const Gap(10),
          _buildSummaryRow("الشحن", "0 د.أ"),
          const Gap(15),
          const Divider(),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("الاجمالي", style: TextStyles.blackBold16),
              Text(
                "499 د.أ",
                style: TextStyles.blackBold16,
              ),
            ],
          ),
          const Gap(20),
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
              child: Text(
                "متابعة التسوق",
                style: TextStyles.blackBold14,
              ),
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
              child: Text(
                "أكمل الطلب",
                style: TextStyles.whiteBold14,
              ),
            ),
          ),
          const Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shield_outlined, color: Colors.green, size: 20),
              const Gap(5),
              Text(
                "دفع آمن",
                style: TextStyles.blackRegular12.copyWith(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                "ارجاع مجاني خلال 14 يوم",
                style: TextStyles.blackRegular12.copyWith(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyles.blackRegular12.copyWith(color: Colors.grey.shade600)),
        Text(value, style: TextStyles.blackBold14),
      ],
    );
  }
}
