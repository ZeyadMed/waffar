import 'package:waffar/core/helper/helper.dart';
import 'package:waffar/core/theme/text_styles.dart';

class ProductInstallmentWidget extends StatelessWidget {
  const ProductInstallmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _InstallmentBanner(
          text:
              'او قسمها على 4 دفعات شهرية بقيمة 4.5 د.إ فقط مع تابي أعرف المزيد',
        ),
        SizedBox(height: 4),
        _InstallmentBanner(
          text:
              'او قسمها على 4 دفعات شهرية بقيمة 4.5 د.إ فقط مع تمارا أعرف المزيد',
        ),
      ],
    );
  }
}

class _InstallmentBanner extends StatelessWidget {
  final String text;

  const _InstallmentBanner({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF7F4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyles.blackBold14.copyWith(fontSize: 12),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
