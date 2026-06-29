import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:waffar/core/style/app_colors.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/flexiable_image.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: FlexibleImage(
            source: Assets.assetsImagesIphone,
            height: 150,
            fit: BoxFit.contain,
          ),
        ),
        const Gap(20),
        Text("كفر ايفون 17 بروماكس اسود جرين ليون", style: TextStyles.blackBold16),
        const Gap(4),
        Text(
          "Green Lion Deludo PC Case",
          style: TextStyles.blackRegular12.copyWith(color: Colors.grey.shade600),
        ),
        const Gap(10),
        Text("499 د.أ", style: TextStyles.blackBold16.copyWith(color: AppColors.primaryColor)),
        const Gap(20),
        Text("وصف المنتج", style: TextStyles.blackBold14),
        const Gap(10),
        Text(
          "يُعد iPhone من أشهر الهواتف الذكية في العالم، حيث يجمع بين التصميم الأنيق والأداء القوي والتقنيات المتطورة. يتميز بشاشة عالية الدقة توفر تجربة مشاهدة رائعة، ومعالج سريع يضمن أداءً سلسًا في التطبيقات والألعاب، بالإضافة إلى نظام تشغيل iOS الذي يوفر مستوى عالٍ من الأمان وسهولة الاستخدام.",
          style: TextStyles.blackRegular12.copyWith(height: 1.5),
        ),
        const Gap(20),
        Text("المميزات الرئيسية:", style: TextStyles.blackBold14),
        const Gap(10),
        _buildBulletPoint("تصميم عصري وخامات عالية الجودة."),
        _buildBulletPoint("شاشة فائقة الوضوح بألوان نابضة بالحياة."),
        _buildBulletPoint("أداء سريع بفضل معالجات Apple المتقدمة."),
        _buildBulletPoint("كاميرات احترافية للتصوير الفوتوغرافي."),
        _buildBulletPoint("نظام أمان متطور وحماية للخصوصية."),
        const Gap(40),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0, left: 8.0),
            child: CircleAvatar(radius: 3, backgroundColor: Colors.black),
          ),
          Expanded(
            child: Text(text, style: TextStyles.blackRegular12.copyWith(height: 1.5)),
          ),
        ],
      ),
    );
  }
}
