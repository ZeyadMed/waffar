import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/theme/text_styles.dart';

class CartSearchBar extends StatelessWidget {
  const CartSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Text(
                    "ما الذي تبحث عنه ...",
                    style: TextStyles.blackRegular12.copyWith(color: Colors.grey),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          const Gap(12),
          const Icon(Icons.arrow_forward, color: Colors.white),
        ],
      ),
    );
  }
}
