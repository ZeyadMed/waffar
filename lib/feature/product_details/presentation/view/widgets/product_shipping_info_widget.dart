import 'package:waffar/core/helper/helper.dart';
import 'package:waffar/core/theme/text_styles.dart';

class ProductShippingInfoWidget extends StatelessWidget {
  const ProductShippingInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _InfoRow(
            right: 'ضمان 1 سنة',
            left: 'اطلب الان ليصلك خلال\n5 أيام 20 يوليو',
            leftColor: AppColors.redColor2,
          ),
          Divider(height: 1, color: Colors.grey.shade200),
          _InfoRow(
            right: 'رسوم التوصيل 20 د.إ',
            left: 'دفع عند الاستلام',
            leftColor: AppColors.redColor2,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String right;
  final String left;
  final Color leftColor;

  const _InfoRow({
    required this.right,
    required this.left,
    required this.leftColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            left,
            style: TextStyles.blackBold14.copyWith(color: leftColor, fontSize: 12),
          ),
          Text(right, style: TextStyles.blackBold14.copyWith(fontSize: 13)),
        ],
      ),
    );
  }
}
