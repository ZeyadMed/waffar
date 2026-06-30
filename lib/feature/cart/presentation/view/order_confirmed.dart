import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:waffar/core/common_widget/label.dart';
import 'package:waffar/core/router/app_router.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/theme/text_styles.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const orderNumber = '#98776589807989';

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _SuccessIcon(),
              const Gap(24),
              LocalizedLabel(
                text: 'order_confirmed_title',
                style: TextStyles.blackBold16.copyWith(fontSize: 22),
                textAlign: TextAlign.center,
              ),
              const Gap(8),
              LocalizedLabel(
                text: 'order_confirmed_subtitle',
                style: TextStyles.darkRegular14.copyWith(
                  color: AppColors.greyColor,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(32),
              _OrderNumberCard(orderNumber: orderNumber),
              const Gap(20),
              LocalizedLabel(
                text: 'order_email_notice',
                style: TextStyles.darkRegular14.copyWith(
                  color: AppColors.greyColor,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(32),
              _TrackOrderButton(
                onTap: () {
                  context.push(
                    AppRouter.orderDetailsScreen,
                    extra: orderNumber,
                  );
                },
              ),
              const Gap(12),
              GestureDetector(
                onTap: () {
                  context.go(AppRouter.initialRoot);
                },
                child: LocalizedLabel(
                  text: 'back_to_home',
                  style: TextStyles.darkBold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SuccessIcon extends StatelessWidget {
  const _SuccessIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.check, color: Colors.white, size: 48),
    );
  }
}

class _OrderNumberCard extends StatelessWidget {
  final String orderNumber;

  const _OrderNumberCard({required this.orderNumber});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocalizedLabel(
          text: 'order_number_label',
          style: TextStyles.darkRegular14.copyWith(color: AppColors.greyColor),
          textAlign: TextAlign.center,
        ),
        const Gap(4),
        Text(
          orderNumber,
          style: TextStyles.darkBold16.copyWith(
            color: AppColors.primaryColor,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _TrackOrderButton extends StatelessWidget {
  final VoidCallback onTap;

  const _TrackOrderButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: LocalizedLabel(
            text: 'track_order',
            style: TextStyles.whiteBold15,
          ),
        ),
      ),
    );
  }
}
