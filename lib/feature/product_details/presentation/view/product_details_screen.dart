import 'package:gap/gap.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/widget/app_bar_custom.dart';
import 'package:waffar/feature/product_details/presentation/view/widgets/product_add_to_cart_button.dart';
import 'package:waffar/feature/product_details/presentation/view/widgets/product_brand_widget.dart';
import 'package:waffar/feature/product_details/presentation/view/widgets/product_description_widget.dart';
import 'package:waffar/feature/product_details/presentation/view/widgets/product_image_banner.dart';
import 'package:waffar/feature/product_details/presentation/view/widgets/product_image_thumbnails.dart';
import 'package:waffar/feature/product_details/presentation/view/widgets/product_info_widget.dart';
import 'package:waffar/feature/product_details/presentation/view/widgets/product_installment_widget.dart';
import 'package:waffar/feature/product_details/presentation/view/widgets/product_quantity_selector.dart';
import 'package:waffar/feature/product_details/presentation/view/widgets/product_rating_widget.dart';
import 'package:waffar/feature/product_details/presentation/view/widgets/product_shipping_info_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<String> _images = [
    Assets.assetsImagesIphone,
    Assets.assetsImagesEstshwar,
    Assets.assetsImagesIphone,
    Assets.assetsImagesSplash,
    Assets.assetsImagesIphone,
  ];

  int _selectedImageIndex = 0;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const AppBarCustom(isLogoEnabled: false),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductImageBanner(image: _images[_selectedImageIndex]),
                    ProductImageThumbnails(
                      images: _images,
                      selectedIndex: _selectedImageIndex,
                      onSelect: (i) => setState(() => _selectedImageIndex = i),
                    ),
                    const Gap(16),
                    const ProductInfoWidget(),
                    const Gap(8),
                    const ProductBrandWidget(),
                    const Gap(4),
                    const ProductInstallmentWidget(),
                    const Gap(12),
                    const ProductShippingInfoWidget(),
                    const Gap(16),
                    ProductQuantitySelector(
                      quantity: _quantity,
                      onDecrement: () {
                        if (_quantity > 1) setState(() => _quantity--);
                      },
                      onIncrement: () => setState(() => _quantity++),
                    ),
                    const Gap(16),
                    const ProductDescriptionWidget(),
                    const Gap(16),
                    const ProductRatingWidget(),
                    const Gap(24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: ProductAddToCartButton(onPressed: () {}),
                          ),
                         
                          Image.asset("assets/images/logos_whatsapp-icon.png"),
                        ],
                      ),
                    ),
                    const Gap(24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
