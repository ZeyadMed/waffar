import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waffar/core/helper/helper.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/quantity_button.dart';

class ProductQuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const ProductQuantitySelector({
    super.key,
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text('quantity'.tr(), style: TextStyles.blackBold14),
          const Spacer(),
          QuantityButton(icon: Icons.remove, onTap: onDecrement),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('$quantity', style: TextStyles.blackBold16),
          ),
          QuantityButton(icon: Icons.add, onTap: onIncrement),
        ],
      ),
    );
  }
}
