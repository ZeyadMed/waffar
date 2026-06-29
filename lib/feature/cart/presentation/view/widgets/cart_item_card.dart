import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/extension/context_extension.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/flexiable_image.dart';
import 'package:waffar/core/widget/quantity_button.dart';

class CartItemCard extends StatelessWidget {
  final String productName;
  final String productDescription;
  final void Function()? onTapDelete;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const CartItemCard({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
    required this.productName,
    required this.productDescription,
    this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: AppColors.greyColor, width: 0.5),
        ),
        child: Row(
          children: [
            FlexibleImage(
              source: Assets.assetsImagesIphone,
              width: 80,
              height: context.screenHeight * 0.1,
            ),
            Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName, style: TextStyles.blackBold14),
                Gap(5),
                Text(productDescription, style: TextStyles.blackRegular14),
                Gap(25),
                _buildQuantitySelector(),
              ],
            ),
            Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onTapDelete,
                  child: Icon(Icons.delete, color: AppColors.greyColor),
                ),
                Gap(10),
                Text(
                  "499 SAR",
                  style: TextStyles.blackBold14.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Text('الكمية', style: TextStyles.blackBold14),
        // Gap(8),
        QuantityButton(
          icon: Icons.remove,
          onTap: () {
            if (quantity > 1) onQuantityChanged(quantity - 1);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text('$quantity', style: TextStyles.blackBold16),
        ),
        QuantityButton(
          icon: Icons.add,
          onTap: () => onQuantityChanged(quantity + 1),
        ),
      ],
    );
  }
}
