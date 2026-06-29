import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:waffar/core/extension/context_extension.dart';
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
      height: context.screenHeight * 0.09,
      color: AppColors.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isLogoEnabled
              ? FlexibleImage(
                  source: Assets.assetsImagesSplash,
                  width: 100,
                  height: 100,
                )
              : GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                ),
          const Gap(10),
          Expanded(
            child: Customtextfield(
              hintText: 'whatـareـyouـlookingـfor'.tr(),
              textEditingController: TextEditingController(),
              prefix: const Icon(Icons.search),
              readOnly: true,
              onTap: () => GoRouter.of(context).pushNamed(AppRouter.login),
            ),
          ),
        ],
      ),
    );
  }
}
