import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/build_row_summary_widget.dart';
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
          Text('order_summary'.tr(), style: TextStyles.blackBold16),
          const Gap(10),
          const DiscountCodeField(),
          const Gap(20),
          BuildRowSummaryWidget('summary_total'.tr(), "499 د.أ"),
          const Gap(10),
          BuildRowSummaryWidget('summary_discount'.tr(), "0 د.أ"),
          const Gap(10),
          BuildRowSummaryWidget('summary_shipping'.tr(), "0 د.أ"),
          const Gap(15),
          const Divider(),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('summary_grand_total'.tr(), style: TextStyles.blackBold16),
              Text("499 د.أ", style: TextStyles.blackBold16),
            ],
          ),
          const Gap(20),
          const OrderActionButtons(),
        ],
      ),
    );
  }

  
  
}
