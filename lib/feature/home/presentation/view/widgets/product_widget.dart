import 'package:easy_localization/easy_localization.dart';
import 'package:gap/gap.dart';
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
      child: SizedBox(
        width: 170,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .3),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffFFEEEE),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: const Color(0xffC91B1B),
                      width: .5,
                    ),
                  ),
                  child: Text(
                    'discount_17'.tr(),
                    style: TextStyle(
                      color: const Color(0xffC91B1B),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Center(
                child: FlexibleImage(
                  source: image,
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
              const Gap(5),
              Text(
                name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.blackBold14.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyles.blackBold14.copyWith(
                          color: Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(4),
                      if (discountPrice != null) ...[
                        Text(
                          discountPrice!,
                          style: TextStyles.blackBold14.copyWith(
                            color: Colors.grey,
                            fontSize: 12.sp,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const Gap(5),
                      ],
                    ],
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: AppColors.primaryColor,
                    size: 24,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
