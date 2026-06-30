import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/suggestion_product_card.dart';

class FreeDeliverySuggestionsWidget extends StatelessWidget {
  final VoidCallback onProductTap;
  const FreeDeliverySuggestionsWidget({super.key, required this.onProductTap});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('free_delivery_chance'.tr(), style: TextStyles.blackBold14),
          const Gap(4),
          Text(
            'free_delivery_hint'.tr(),
            textAlign: TextAlign.center,
            style: TextStyles.blackRegular12.copyWith(color: Colors.grey.shade600, height: 1.5),
          ),
          const Gap(16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => SuggestionProductCard(onTap: onProductTap),
          ),
        ],
      ),
    );
  }
}
