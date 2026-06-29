import 'package:gap/gap.dart';
import 'package:waffar/core/extension/context_extension.dart';
import 'package:waffar/core/helper/helper.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/flexiable_image.dart';

class ProductWidget extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String? discountPrice;
  final void Function()? onTap;
  const ProductWidget({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    this.discountPrice,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          color: Colors.white,
          // borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            FlexibleImage(
              source: image,
              width: context.screenWidth * 0.3,
              height: context.screenHeight * 0.15,
              fit: BoxFit.cover,
            ),
            const Gap(5),
            Text(
              name,
              style: TextStyles.blackBold14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyles.blackBold14.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(5),
                Text(
                  discountPrice ?? '',
                  style: TextStyles.blackBold14.copyWith(
                    color: AppColors.lightTextColor,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                // const Spacer(),
                // GestureDetector(
                //   onTap: () {
                //     // Handle add to cart action
                //   },
                //   child: Icon(
                //     Icons.favorite_border,
                //     color: AppColors.primaryColor,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
