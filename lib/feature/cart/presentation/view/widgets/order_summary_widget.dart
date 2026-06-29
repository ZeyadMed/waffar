import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/discount_code_field.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/order_action_buttons.dart';

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
          const DiscountCodeField(),
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
              Text("499 د.أ", style: TextStyles.blackBold16),
            ],
          ),
          const Gap(20),
          const OrderActionButtons(),
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
