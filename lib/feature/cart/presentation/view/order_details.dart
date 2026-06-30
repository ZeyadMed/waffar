import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/common_widget/label.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/flexiable_image.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/cart_search_bar.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const orderNumber = '#9877658980795896758';
    const orderDate = '29 مايو 2026 - 10:30 م';

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _OrderInfoCard(
                      orderNumber: orderNumber,
                      orderDate: orderDate,
                    ),
                    const Gap(16),
                    _ProductsSection(),
                    const Gap(16),
                    _OrderTotalRow(),
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

class _OrderInfoCard extends StatelessWidget {
  final String orderNumber;
  final String orderDate;

  const _OrderInfoCard({required this.orderNumber, required this.orderDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LocalizedLabel(
            text: 'order_details_title',
            style: TextStyles.blackBold16.copyWith(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const Gap(12),
          Text(
            orderNumber,
            style: TextStyles.blackBold16.copyWith(
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(4),
          Text(
            orderDate,
            style: TextStyles.darkRegular14.copyWith(
              color: AppColors.greyColor,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(20),
          _TrackingSteps(),
        ],
      ),
    );
  }
}

class _TrackingSteps extends StatelessWidget {
  const _TrackingSteps();

  @override
  Widget build(BuildContext context) {
    final steps = [
      'tracking_ordered',
      'tracking_prepared',
      'tracking_shipped',
      'tracking_delivered',
    ];

    const completedCount = 3;

    return Column(
      children: [
        Row(
          children: List.generate(steps.length * 2 - 1, (i) {
            if (i.isOdd) {
              final lineIndex = i ~/ 2;
              final isCompleted = lineIndex < completedCount - 1;
              return Expanded(
                child: Container(
                  height: 2,
                  color: isCompleted
                      ? AppColors.primaryColor
                      : Colors.grey.shade300,
                ),
              );
            }
            final stepIndex = i ~/ 2;
            final isCompleted = stepIndex < completedCount;
            return _TrackingDot(isCompleted: isCompleted);
          }),
        ),
        const Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: steps
              .map(
                (step) => Expanded(
                  child: LocalizedLabel(
                    text: step,
                    style: TextStyles.darkRegular12.copyWith(
                      color: AppColors.greyColor,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _TrackingDot extends StatelessWidget {
  final bool isCompleted;

  const _TrackingDot({required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isCompleted ? AppColors.primaryColor : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.check, color: Colors.white, size: 16),
    );
  }
}

class _ProductsSection extends StatelessWidget {
  const _ProductsSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          LocalizedLabel(
            text: 'order_products_details',
            style: TextStyles.blackBold16.copyWith(fontSize: 18),
          ),
          const Gap(12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) => _OrderProductItem(
              productName: 'prod_name_dummy'.tr(),
              productDescription: 'Green Lion Delado Pc Case',
              price: 'prod_price_dummy'.tr(),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderProductItem extends StatelessWidget {
  final String productName;
  final String productDescription;
  final String price;

  const _OrderProductItem({
    required this.productName,
    required this.productDescription,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlexibleImage(
              source: Assets.assetsImagesIphone,
              width: 70,
              height: 90,
              fit: BoxFit.contain,
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    productName,
                    style: TextStyles.blackBold14,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const Gap(4),
                  Text(
                    productDescription,
                    style: TextStyles.blackRegular12.copyWith(
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(12),
                  Text(
                    price,
                    style: TextStyles.blackBold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
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

class _OrderTotalRow extends StatelessWidget {
  const _OrderTotalRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '1250 د.أ',
            style: TextStyles.blackBold16.copyWith(fontSize: 18),
          ),
          LocalizedLabel(
            text: 'summary_grand_total',
            style: TextStyles.blackBold16.copyWith(fontSize: 18),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
