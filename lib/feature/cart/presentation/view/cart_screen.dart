import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/cart_item_card.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/cart_search_bar.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/free_delivery_suggestions_widget.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/order_summary_widget.dart';
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
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CartSearchBar(),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'cart'.tr(),
                  style: TextStyles.blackBold16.copyWith(fontSize: 18),
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) => CartItemCard(
                        productName: 'prod_name_dummy'.tr(),
                        productDescription: "Green Lion Deludo PC Case",
                        price: 'prod_price_dummy'.tr(),
                        quantity: _quantity1,
                        onQuantityChanged: (val) =>
                            setState(() => _quantity1 = val),
                        onTapDelete: () {},
                        onImageTap: _showProductDetails,
                      ),
                    ),
                    const Gap(10),
                    const OrderSummaryWidget(),
                    const Gap(16),
                    FreeDeliverySuggestionsWidget(
                      onProductTap: _showProductDetails,
                    ),
                    const Gap(30),
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
