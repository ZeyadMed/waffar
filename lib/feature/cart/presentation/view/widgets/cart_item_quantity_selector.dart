import 'package:flutter/material.dart';
import 'package:waffar/core/theme/text_styles.dart';

class CartItemQuantitySelector extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const CartItemQuantitySelector({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => onQuantityChanged(quantity + 1),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Icon(Icons.add, size: 16, color: Colors.black54),
            ),
          ),
          Text('$quantity', style: TextStyles.blackBold14),
          InkWell(
            onTap: () {
              if (quantity > 1) onQuantityChanged(quantity - 1);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Icon(Icons.remove, size: 16, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
