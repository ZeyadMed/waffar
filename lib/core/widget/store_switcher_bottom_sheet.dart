import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/common_widget/label.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/theme/text_styles.dart';

class StoreSwitcherBottomSheet extends StatefulWidget {
  const StoreSwitcherBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const StoreSwitcherBottomSheet(),
    );
  }

  @override
  State<StoreSwitcherBottomSheet> createState() =>
      _StoreSwitcherBottomSheetState();
}

class _StoreSwitcherBottomSheetState extends State<StoreSwitcherBottomSheet> {
  int _selectedStoreIndex = 0; // 0 for UAE, 1 for KSA

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: AppColors.primaryColor),
                onPressed: () => Navigator.pop(context),
              ),
              LocalizedLabel(
                text: "تبديل المتجر",
                style: TextStyles.blackBold16,
              ),
              const SizedBox(width: 48), // Balance for title centering
            ],
          ),
          const Gap(20),
          _buildStoreOption(
            index: 0,
            title: "متجر الامارات",
            features: [
              "خيارات اكثر للمنتجات",
              "اسعار تنافسية",
              "يشمل كافة مدن الامارات",
            ],
          ),
          const Gap(15),
          _buildStoreOption(
            index: 1,
            title: "متجر السعودية",
            features: [
              "توصيل سريع",
              "منتجات ذات علامات تجارية موثوقة",
              "يشمل انحاء محلية",
            ],
          ),
          const Gap(30),
        ],
      ),
    );
  }

  Widget _buildStoreOption({
    required int index,
    required String title,
    required List<String> features,
  }) {
    final isSelected = _selectedStoreIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedStoreIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withValues(alpha: 0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // Align to right (Arabic)
          children: [
            Row(
              children: [
                Icon(
                  isSelected ? Icons.check_box : Icons.check_box_outline_blank,
                  color: isSelected ? AppColors.primaryColor : Colors.grey,
                ),
                const Gap(10),
                Text(
                  title,
                  style: TextStyles.blackBold14.copyWith(
                    color: isSelected ? AppColors.primaryColor : Colors.black,
                  ),
                ),
              ],
            ),
            const Gap(10),
            ...features.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check,
                      size: 14,
                      color: AppColors.primaryColor,
                    ),
                    const Gap(6),
                    Text(
                      feature,
                      style: TextStyles.blackRegular12.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
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
