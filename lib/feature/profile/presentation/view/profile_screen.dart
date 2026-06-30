import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/common_widget/label.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/app_bar_custom.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBarCustom(isLogoEnabled: false),
              const Gap(12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _SettingsSection(),
                    const Gap(12),
                    _ProfileCard(),
                    const Gap(8),
                    _SecurityNote(),
                    const Gap(12),
                    _QuickActionsGrid(),
                    const Gap(12),
                    _PendingOrderBanner(),
                    const Gap(12),
                    _SocialMediaSection(),
                    const Gap(20),
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

class _SettingsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          LocalizedLabel(text: 'profile_settings', style: TextStyles.blackBold16),
          const Gap(8),
          _SettingsDropdownRow(
            flag: '🌐',
            label: 'profile_language',
            value: isArabic ? 'profile_language_arabic' : 'profile_language_english',
            onTap: () => _showLanguagePicker(context),
          ),
          const Divider(height: 16, thickness: 0.4),
          _SettingsDropdownRow(
            flag: '🇦🇪',
            label: 'profile_currency',
            value: 'profile_currency_aed',
          ),
        ],
      ),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (sheetCtx) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('profile_language_arabic'.tr()),
              trailing: isArabic
                  ? const Icon(Icons.check, color: AppColors.primaryColor)
                  : null,
              onTap: () {
                Navigator.pop(sheetCtx);
                context.setLocale(const Locale('ar'));
              },
            ),
            ListTile(
              title: Text('profile_language_english'.tr()),
              trailing: !isArabic
                  ? const Icon(Icons.check, color: AppColors.primaryColor)
                  : null,
              onTap: () {
                Navigator.pop(sheetCtx);
                context.setLocale(const Locale('en'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsDropdownRow extends StatelessWidget {
  final String flag;
  final String label;
  final String value;
  final VoidCallback? onTap;

  const _SettingsDropdownRow({
    required this.flag,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            onTap != null ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_down,
            color: Colors.grey,
            size: 20,
          ),
          Row(
            children: [
              LocalizedLabel(text: value, style: TextStyles.darkRegular14),
              const Gap(6),
              Text(flag, style: const TextStyle(fontSize: 16)),
            ],
          ),
          LocalizedLabel(
            text: label,
            style: TextStyles.darkBold14.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.logout,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.edit_outlined,
                  color: AppColors.primaryColor,
                  size: 22,
                ),
              ),
            ],
          ),
          const Gap(8),
          CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.primaryColor.withValues(alpha: 0.15),
            child: const Icon(
              Icons.person,
              size: 50,
              color: AppColors.primaryColor,
            ),
          ),
          const Gap(12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Label(
                  text: 'Mohamed Fathy',
                  style: TextStyles.blackBold16,
                  textAlign: TextAlign.center,
                ),
                const Gap(4),
                Label(
                  text: 'mohamedfathy12@gmail.com',
                  style: TextStyles.darkRegular14,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SecurityNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Center(
        child: LocalizedLabel(
          text: 'profile_security_note',
          style: TextStyles.darkBold14.copyWith(color: AppColors.primaryColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _QuickActionsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rows = [
      [
        (icon: Icons.folder_open_outlined, label: 'profile_my_orders'),
        (icon: Icons.location_on_outlined, label: 'profile_track_order'),
      ],
      [
        (icon: Icons.access_time_outlined, label: 'profile_recently_viewed'),
        (icon: Icons.favorite_outline, label: 'profile_wishlist'),
      ],
    ];

    return Column(
      children: rows
          .map(
            (row) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: IntrinsicHeight(
                child: Row(
                  children: row
                      .map(
                        (action) => Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: action == row.last ? 0 : 5,
                              right: action == row.first ? 0 : 5,
                            ),
                            child: _ActionTile(
                              icon: action.icon,
                              label: action.label,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios, size: 14, color: Colors.grey),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: LocalizedLabel(
                      text: label,
                      style: TextStyles.darkBold14,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const Gap(6),
                  Icon(icon, size: 18, color: AppColors.primaryColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PendingOrderBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          LocalizedLabel(
            text: 'profile_pending_order_question',
            style: TextStyles.darkBold14,
            textAlign: TextAlign.end,
          ),
          const Gap(10),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LocalizedLabel(
                    text: 'profile_track_order',
                    style: TextStyles.darkBold14.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Gap(6),
                  const Icon(
                    Icons.local_shipping_outlined,
                    color: AppColors.primaryColor,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialMediaSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final platforms = [
      (
        icon: FontAwesomeIcons.instagram,
        label: 'profile_instagram',
        color: const Color(0xFFE1306C),
      ),
      (
        icon: FontAwesomeIcons.tiktok,
        label: 'profile_tiktok',
        color: Colors.black,
      ),
      (
        icon: FontAwesomeIcons.youtube,
        label: 'profile_youtube',
        color: const Color(0xFFFF0000),
      ),
      (
        icon: FontAwesomeIcons.snapchat,
        label: 'profile_snapchat',
        color: const Color(0xFFFFFC00),
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          LocalizedLabel(
            text: 'profile_follow_us',
            style: TextStyles.blackBold16,
            textAlign: TextAlign.end,
          ),
          const Gap(12),
          ...platforms.map(
            (p) => Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(p.icon, size: 20, color: p.color),
                        const Gap(10),
                        LocalizedLabel(
                          text: p.label,
                          style: TextStyles.darkBold14,
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
