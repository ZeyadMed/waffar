import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:waffar/core/common_widget/label.dart';
import 'package:waffar/core/helper/validators.dart';
import 'package:waffar/core/router/app_router.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/custom_phone_field.dart';
import 'package:waffar/core/widget/custom_text_field.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/cart_item_card.dart';
import 'package:waffar/feature/cart/presentation/view/widgets/cart_search_bar.dart';

class ShippingDetails extends StatefulWidget {
  const ShippingDetails({super.key});

  @override
  State<ShippingDetails> createState() => _ShippingDetailsState();
}

class _ShippingDetailsState extends State<ShippingDetails> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _backupPhoneController = TextEditingController();
  final _cityController = TextEditingController();
  final _regionController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _noteController = TextEditingController();

  bool _showBackupPhone = false;
  bool _showNote = false;

  int _selectedPaymentMethod = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _backupPhoneController.dispose();
    _cityController.dispose();
    _regionController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _noteController.dispose();
    super.dispose();
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LocalizedLabel(
                      text: 'shipping_details',
                      style: TextStyles.blackBold16.copyWith(fontSize: 18),
                    ),
                    const Gap(16),
                    _ShippingFormSection(
                      nameController: _nameController,
                      phoneController: _phoneController,
                      backupPhoneController: _backupPhoneController,
                      cityController: _cityController,
                      regionController: _regionController,
                      addressController: _addressController,
                      emailController: _emailController,
                      noteController: _noteController,
                      showBackupPhone: _showBackupPhone,
                      showNote: _showNote,
                      onShowBackupPhone: () =>
                          setState(() => _showBackupPhone = true),
                      onShowNote: () => setState(() => _showNote = true),
                      onPhoneChanged: (PhoneNumber phone) {},
                      onBackupPhoneChanged: (PhoneNumber phone) {},
                    ),
                    const Gap(24),
                    LocalizedLabel(
                      text: 'choose_payment_method',
                      style: TextStyles.blackBold16.copyWith(fontSize: 18),
                    ),
                    const Gap(12),
                    _PaymentMethodSection(
                      selectedMethod: _selectedPaymentMethod,
                      onMethodChanged: (val) =>
                          setState(() => _selectedPaymentMethod = val),
                    ),
                    const Gap(24),
                    _CompleteOrderButton(
                      onTap: () => context.push(AppRouter.orderConfirmedScreen),
                    ),
                    const Gap(12),
                    Center(
                      child: GestureDetector(
                        onTap: () => _OrderDetailsBottomSheet.show(context),
                        child: LocalizedLabel(
                          text: 'details',
                          style: TextStyles.darkBold16.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
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

class _ShippingFormSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController backupPhoneController;
  final TextEditingController cityController;
  final TextEditingController regionController;
  final TextEditingController addressController;
  final TextEditingController emailController;
  final TextEditingController noteController;
  final bool showBackupPhone;
  final bool showNote;
  final VoidCallback onShowBackupPhone;
  final VoidCallback onShowNote;
  final void Function(PhoneNumber) onPhoneChanged;
  final void Function(PhoneNumber) onBackupPhoneChanged;

  const _ShippingFormSection({
    required this.nameController,
    required this.phoneController,
    required this.backupPhoneController,
    required this.cityController,
    required this.regionController,
    required this.addressController,
    required this.emailController,
    required this.noteController,
    required this.showBackupPhone,
    required this.showNote,
    required this.onShowBackupPhone,
    required this.onShowNote,
    required this.onPhoneChanged,
    required this.onBackupPhoneChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Customtextfield(
            hintText: 'name',
            textEditingController: nameController,
            validator: Validators.displayNameValidator,
          ),
          // const Gap(4),
          // LocalizedLabel(
          //   text: 'name_required',
          //   style: TextStyles.darkRegular12.copyWith(
          //     color: AppColors.primaryColor,
          //   ),
          // ),
          const Gap(12),
          CustomPhoneField(
            controller: phoneController,
            onChanged: onPhoneChanged,
          ),
          const Gap(8),
          if (showBackupPhone) ...[
            CustomPhoneField(
              controller: backupPhoneController,
              onChanged: onBackupPhoneChanged,
            ),
            const Gap(8),
          ],
          GestureDetector(
            onTap: onShowBackupPhone,
            child: Row(
              children: [
                Icon(Icons.add, size: 16, color: AppColors.primaryColor),
                const Gap(4),
                LocalizedLabel(
                  text: 'add_backup_phone',
                  style: TextStyles.darkRegular14.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Gap(12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Customtextfield(
                      hintText: 'city_name',
                      textEditingController: cityController,
                      validator: Validators.displayNameValidator,
                    ),
                    // const Gap(4),
                    // LocalizedLabel(
                    //   text: 'city_required',
                    //   style: TextStyles.darkRegular12.copyWith(
                    //     color: AppColors.primaryColor,
                    //   ),
                    // ),
                  ],
                ),
              ),
              // const Gap(8),
              // Expanded(
              //   child: GestureDetector(
              //     onTap: () {},
              //     child: Container(
              //       padding: const EdgeInsets.symmetric(
              //         horizontal: 12,
              //         vertical: 14,
              //       ),
              //       decoration: BoxDecoration(
              //         color: AppColors.whiteColor,
              //         borderRadius: BorderRadius.circular(5),
              //         border: Border.all(color: Colors.grey, width: 0.5),
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           LocalizedLabel(
              //             text: 'change_country',
              //             style: TextStyles.darkRegular14.copyWith(
              //               color: AppColors.primaryColor,
              //             ),
              //           ),
              //           const Icon(
              //             Icons.keyboard_arrow_down,
              //             color: AppColors.primaryColor,
              //             size: 18,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          const Gap(12),
          Customtextfield(
            hintText: 'region_name',
            textEditingController: regionController,
          ),
          const Gap(12),
          Customtextfield(
            hintText: 'address_street',
            textEditingController: addressController,
          ),
          const Gap(12),
          if (showNote) ...[
            Customtextfield(
              hintText: 'add_note',
              textEditingController: noteController,
              maxLines: 3,
              minLines: 3,
            ),
            const Gap(8),
          ],
          GestureDetector(
            onTap: onShowNote,
            child: Row(
              children: [
                Icon(Icons.add, size: 16, color: AppColors.primaryColor),
                const Gap(4),
                LocalizedLabel(
                  text: 'add_note_label',
                  style: TextStyles.darkRegular14.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Gap(12),
          Customtextfield(
            hintText: 'email',
            textEditingController: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}

class _PaymentMethodSection extends StatelessWidget {
  final int selectedMethod;
  final void Function(int) onMethodChanged;

  const _PaymentMethodSection({
    required this.selectedMethod,
    required this.onMethodChanged,
  });

  @override
  Widget build(BuildContext context) {
    final methods = [
      (icon: Icons.credit_card_outlined, key: 'pay_by_card'),
      (icon: Icons.money_outlined, key: 'pay_on_delivery'),
      (icon: Icons.calendar_today_outlined, key: 'pay_tabby'),
      (icon: Icons.calendar_month_outlined, key: 'pay_tamara'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: List.generate(methods.length, (index) {
          final method = methods[index];
          final isLast = index == methods.length - 1;
          return Column(
            children: [
              GestureDetector(
                onTap: () => onMethodChanged(index),
                child: Row(
                  children: [
                    // ignore: deprecated_member_use
                    Radio<int>(
                      value: index,
                      groupValue: selectedMethod,
                      // ignore: deprecated_member_use
                      onChanged: (val) => onMethodChanged(val!),
                      activeColor: AppColors.primaryColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                    const Gap(8),
                    Icon(method.icon, size: 20, color: AppColors.greyColor),
                    const Gap(8),
                    Expanded(
                      child: LocalizedLabel(
                        text: method.key,
                        style: TextStyles.darkRegular14,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isLast)
                const Divider(height: 16, thickness: 0.5, color: Colors.grey),
            ],
          );
        }),
      ),
    );
  }
}

class _CompleteOrderButton extends StatelessWidget {
  final VoidCallback onTap;

  const _CompleteOrderButton({required this.onTap});

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
            text: 'complete_order',
            style: TextStyles.whiteBold15,
          ),
        ),
      ),
    );
  }
}

class _OrderDetailsBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const _OrderDetailsContent(),
    );
  }
}

class _OrderDetailsContent extends StatelessWidget {
  const _OrderDetailsContent();

  List<({String name, String description, String price, int quantity})> get _cartItems => [
    (name: 'prod_name_dummy'.tr(), description: 'Green Lion Deludo PC Case', price: 'prod_price_dummy'.tr(), quantity: 1),
    (name: 'prod_name_dummy'.tr(), description: 'Green Lion Deludo PC Case', price: 'prod_price_dummy'.tr(), quantity: 1),
    (name: 'prod_name_dummy'.tr(), description: 'Green Lion Deludo PC Case', price: 'prod_price_dummy'.tr(), quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            const Gap(12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LocalizedLabel(
                    text: 'details',
                    style: TextStyles.blackBold16.copyWith(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Gap(12),
            const Divider(height: 1),
            Expanded(
              child: ListView(
                controller: controller,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                children: [
                  ..._cartItems.map(
                    (item) => CartItemCard(
                      productName: item.name,
                      productDescription: item.description,
                      price: item.price,
                      quantity: item.quantity,
                      onQuantityChanged: (_) {},
                      showQuantitySelector: false,
                      showDeleteIcon: false,
                    ),
                  ),
                  const Gap(8),
                  _OrderSummarySection(),
                  const Gap(16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderSummarySection extends StatelessWidget {
  const _OrderSummarySection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocalizedLabel(
            text: 'order_summary',
            style: TextStyles.blackBold16,
          ),
          const Gap(12),
          _buildRow('summary_total', '499 د.أ'),
          const Gap(8),
          _buildRow('summary_discount', '0 د.أ'),
          const Gap(8),
          _buildRow('summary_shipping', '0 د.أ'),
          const Gap(12),
          const Divider(),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LocalizedLabel(
                text: 'summary_grand_total',
                style: TextStyles.blackBold16,
              ),
              Text('499 د.أ', style: TextStyles.blackBold16),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String labelKey, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LocalizedLabel(
          text: labelKey,
          style: TextStyles.darkRegular14.copyWith(color: Colors.grey.shade600),
        ),
        Text(value, style: TextStyles.blackBold14),
      ],
    );
  }
}
