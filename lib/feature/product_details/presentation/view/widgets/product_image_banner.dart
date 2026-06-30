import 'package:waffar/core/extension/context_extension.dart';
import 'package:waffar/core/helper/helper.dart';
import 'package:waffar/core/widget/flexiable_image.dart';

class ProductImageBanner extends StatelessWidget {
  final String image;

  const ProductImageBanner({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.screenHeight * 0.35,
      color: AppColors.semiWhiteColor,
      child: FlexibleImage(
        source: image,
        width: double.infinity,
        height: context.screenHeight * 0.35,
        fit: BoxFit.contain,
      ),
    );
  }
}
