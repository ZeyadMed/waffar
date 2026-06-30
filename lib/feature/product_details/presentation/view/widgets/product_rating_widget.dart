import 'package:gap/gap.dart';
import 'package:waffar/core/helper/helper.dart';
import 'package:waffar/core/theme/text_styles.dart';

class ProductRatingWidget extends StatefulWidget {
  const ProductRatingWidget({super.key});

  @override
  State<ProductRatingWidget> createState() => _ProductRatingWidgetState();
}

class _ProductRatingWidgetState extends State<ProductRatingWidget> {
  int _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('التقييمات', style: TextStyles.blackBold16),
          const Gap(16),
          Center(
            child: Column(
              children: [
                Text(
                  '0.0',
                  style: TextStyles.blackBold20.copyWith(
                    color: Colors.amber,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(4),
                _Stars(count: 0, size: 22, emptyColor: Colors.grey.shade300),
                const Gap(4),
                Text('0 تقييمات', style: TextStyles.greyRegular15),
              ],
            ),
          ),
          const Gap(16),
          ...List.generate(5, (i) {
            final star = 5 - i;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  Text('(0)', style: TextStyles.greyRegular15.copyWith(fontSize: 12)),
                  const Gap(8),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: 0,
                        minHeight: 8,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
                      ),
                    ),
                  ),
                  const Gap(8),
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  Text('$star', style: TextStyles.blackBold14.copyWith(fontSize: 13)),
                ],
              ),
            );
          }),
          const Gap(16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  'اضافة تقييم',
                  style: TextStyles.blackBold16.copyWith(color: AppColors.primaryColor),
                ),
                const Gap(8),
                Text(
                  'يمكنك اضافة تقييم من خلال اختيار النجوم',
                  style: TextStyles.greyRegular15,
                  textAlign: TextAlign.center,
                ),
                const Gap(12),
                _Stars(
                  count: _selectedRating,
                  size: 30,
                  emptyColor: Colors.grey.shade300,
                  onTap: (i) => setState(() => _selectedRating = i + 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Stars extends StatelessWidget {
  final int count;
  final double size;
  final Color emptyColor;
  final void Function(int)? onTap;

  const _Stars({required this.count, required this.size, required this.emptyColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (i) {
        return GestureDetector(
          onTap: onTap != null ? () => onTap!(i) : null,
          child: Icon(
            i < count ? Icons.star : Icons.star_border,
            color: i < count ? Colors.amber : emptyColor,
            size: size,
          ),
        );
      }),
    );
  }
}
