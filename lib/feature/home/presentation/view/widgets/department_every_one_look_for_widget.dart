import 'package:gap/gap.dart';
import 'package:waffar/core/helper/helper.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/flexiable_image.dart';

class DepartmentEveryOneLookForWidget extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String? discountPrice;
  final void Function()? onTap;
  const DepartmentEveryOneLookForWidget({
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
            children: [
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
              const Gap(5),
            ],
          ),
        ),
      ),
    );
  }
}
