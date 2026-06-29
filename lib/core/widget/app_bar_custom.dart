import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:waffar/core/helper/helper.dart';
import 'package:waffar/core/router/app_router.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/widget/custom_text_field.dart';
import 'package:waffar/core/widget/flexiable_image.dart';

class AppBarCustom extends StatelessWidget {
  final bool isLogoEnabled;
  const AppBarCustom({super.key, required this.isLogoEnabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isLogoEnabled
              ? FlexibleImage(
                  source: Assets.assetsImagesSplash,
                  width: 45,
                  height: 45,
                )
              : GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
          const Gap(10),
          Expanded(
            child: Customtextfield(
              hintText: 'whatـareـyouـlookingـfor'.tr(),
              textEditingController: TextEditingController(),
              suffix: const Padding(
                padding: EdgeInsetsDirectional.only(end: 8),
                child: Icon(Icons.search, color: AppColors.primaryColor),
              ),
              borderRadious: 30,
              //  borderColor: AppColors.primaryColor,
              readOnly: true,
              onTap: () => GoRouter.of(context).pushNamed(AppRouter.login),
            ),
          ),
        ],
      ),
    );
  }
}
