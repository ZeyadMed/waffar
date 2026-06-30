import 'package:gap/gap.dart';
import 'package:waffar/core/helper/helper.dart';
import 'package:waffar/core/theme/text_styles.dart';

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({super.key});

  static const _bullets = [
    'مصمم بطريقة مميزة وعملية',
    'مصنوع من مواد عملية وعالية الجودة',
    'يتوافق الكفر مع ايفون 17 برو ماكس',
    'يعمل على حماية الموبايل من السقوط',
    'مقاوم للصدمات وبصمات الاصابع والاصفرار',
  ];

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
          Text('وصف المنتج', style: TextStyles.blackBold16),
          const Gap(8),
          Text(
            'يحافظ هذا الكفر المميز والجميل على مظهر جهازك جديد وخالي من الخدوش كما يساعد على حمايته من الصدمات والكسور Green Lion Delado Pc Case يتميز بحجمه المناسب ولونه المميز',
            style: TextStyles.greyRegular15,
            textAlign: TextAlign.right,
          ),
          const Gap(12),
          Text('مميزات كفر موبايل جرين ليون:', style: TextStyles.blackBold14),
          const Gap(8),
          ..._bullets.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 7),
                    child: Icon(Icons.circle, size: 6, color: Colors.black54),
                  ),
                  Gap(5),
                  Expanded(
                    child: Text(
                      p,
                      style: TextStyles.greyRegular15,
                      textAlign: TextAlign.right,
                    ),
                  ),

                 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
