import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/common_widget/label.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/cart_item_card.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/order_summary_widget.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/free_delivery_suggestions_widget.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/product_details_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _quantity1 = 1;
  int _quantity2 = 1;

  void _showProductDetails() {
    ProductDetailsBottomSheet.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100, // Slightly grey background to distinguish cards
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Text("ما الذي تبحث عنه ...", style: TextStyles.blackRegular12.copyWith(color: Colors.grey)),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    const Gap(12),
                    const Icon(Icons.arrow_forward, color: Colors.white), // Assuming RTL, this points back/forward appropriately
                  ],
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "عربة التسوق",
                  style: TextStyles.blackBold16.copyWith(fontSize: 18),
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    CartItemCard(
                      productName: "كفر ايفون 17 بروماكس اسود جرين ليون",
                      productDescription: "Green Lion Deludo PC Case",
                      price: "499 د.أ",
                      quantity: _quantity1,
                      onQuantityChanged: (val) => setState(() => _quantity1 = val),
                      onTapDelete: () {},
                      onImageTap: _showProductDetails,
                    ),
                    CartItemCard(
                      productName: "كفر ايفون 17 بروماكس اسود جرين ليون",
                      productDescription: "Green Lion Deludo PC Case",
                      price: "499 د.أ",
                      quantity: _quantity2,
                      onQuantityChanged: (val) => setState(() => _quantity2 = val),
                      onTapDelete: () {},
                      onImageTap: _showProductDetails,
                    ),
                    const Gap(10),
                    const OrderSummaryWidget(),
                    const Gap(16),
                    FreeDeliverySuggestionsWidget(
                      onProductTap: _showProductDetails,
                    ),
                    const Gap(30), // Bottom padding
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
