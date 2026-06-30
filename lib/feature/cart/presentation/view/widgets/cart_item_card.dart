import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/flexiable_image.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/cart_item_quantity_selector.dart';

class CartItemCard extends StatelessWidget {
  final String productName;
  final String productDescription;
  final String price;
  final void Function()? onTapDelete;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback? onImageTap;
  final bool showQuantitySelector;
  final bool showDeleteIcon;

  const CartItemCard({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
    required this.productName,
    required this.productDescription,
    required this.price,
    this.onTapDelete,
    this.onImageTap,
    this.showQuantitySelector = true,
    this.showDeleteIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onImageTap,
              child: FlexibleImage(
                source: Assets.assetsImagesIphone,
                width: 70,
                height: 90,
                fit: BoxFit.contain,
              ),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          productName,
                          style: TextStyles.blackBold14,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (showDeleteIcon)
                        GestureDetector(
                          onTap: onTapDelete,
                          child: const Icon(Icons.delete_outline, color: Colors.grey, size: 20),
                        ),
                    ],
                  ),
                  const Gap(4),
                  Text(
                    productDescription,
                    style: TextStyles.blackRegular12.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price, style: TextStyles.blackBold16.copyWith(color: AppColors.primaryColor)),
                      if (showQuantitySelector)
                        CartItemQuantitySelector(
                          quantity: quantity,
                          onQuantityChanged: onQuantityChanged,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
