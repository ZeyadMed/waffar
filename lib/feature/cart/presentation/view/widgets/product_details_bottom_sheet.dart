import 'package:flutter/material.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/product_details_content.dart';

class ProductDetailsBottomSheet extends StatelessWidget {
  const ProductDetailsBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ProductDetailsBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: ProductDetailsContent(),
            ),
          ),
        ],
      ),
    );
  }
}
