import 'package:gap/gap.dart';
import 'package:waffar/core/helper/helper.dart';
import 'package:waffar/core/theme/text_styles.dart';

class ProductBrandWidget extends StatelessWidget {
  const ProductBrandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(135, 202, 173, 209),
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF6900),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'MI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text('شاومي', style: TextStyles.blackBold14),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'تسوق كل المنتجات',
                style: TextStyles.blackBold14.copyWith(
                  color: AppColors.redColor,
                  fontSize: 13,
                ),
              ),
              Gap(4),
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: AppColors.redColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
