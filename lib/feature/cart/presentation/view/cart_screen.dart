import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/common_widget/label.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/app_bar_custom.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/cart_item_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarCustom(isLogoEnabled: false),
              Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: LocalizedLabel(
                  text: "cart",
                  style: TextStyles.blackBold16.copyWith(fontSize: 20),
                ),
              ),
              Gap(10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => CartItemCard(
                  productName: "Product Name",
                  productDescription: "Product Description",
                  quantity: _quantity,
                  onQuantityChanged: (val) => setState(() => _quantity = val),
                  onTapDelete: () => setState(() => _quantity = 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
