import 'package:gap/gap.dart';
import 'package:waffar/core/helper/helper.dart';
import 'package:waffar/core/extension/context_extension.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/app_bar_custom.dart';
import 'package:waffar/core/widget/custom_button.dart';
import 'package:waffar/core/widget/flexiable_image.dart';
import 'package:waffar/core/widget/quantity_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // Dummy product data
  final List<String> _images = [
    Assets.assetsImagesIphone,
    Assets.assetsImagesEstshwar,
    Assets.assetsImagesIphone,
    Assets.assetsImagesSplash,
    Assets.assetsImagesIphone,
  ];

  int _selectedImageIndex = 0;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const AppBarCustom(isLogoEnabled: false),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageBanner(),
                    _buildImageThumbnailList(),
                    const Gap(16),
                    _buildProductInfo(),
                    const Gap(16),
                    _buildQuantitySelector(),
                    const Gap(16),
                    _buildDescription(),
                    const Gap(24),
                    _buildAddToCartButton(),
                    const Gap(24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageBanner() {
    return Container(
      width: double.infinity,
      height: context.screenHeight * 0.35,
      color: AppColors.semiWhiteColor,
      child: FlexibleImage(
        source: _images[_selectedImageIndex],
        width: double.infinity,
        height: context.screenHeight * 0.35,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildImageThumbnailList() {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _images.length,
        separatorBuilder: (_, __) => const Gap(8),
        itemBuilder: (context, index) {
          final isSelected = _selectedImageIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedImageIndex = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.greyColor5,
                  width: isSelected ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(8),
                color: AppColors.semiWhiteColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: FlexibleImage(
                  source: _images[index],
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'كفر ايفون 17 برو ماكس اسود جرين ليون',
            style: TextStyles.blackBold16,
            textAlign: TextAlign.right,
          ),
          const Gap(4),
          Text('Green Lion Delado Pc Case', style: TextStyles.greyRegular15),
          const Gap(12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.redColor2.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'خصم 17 %',
                  style: TextStyles.darkBold12.copyWith(
                    color: AppColors.redColor2,
                  ),
                ),
              ),
              const Gap(12),
              Text(
                '499 د.إ',
                style: TextStyles.blackBold20.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const Gap(8),
              Text(
                '600 د.إ',
                style: TextStyles.greyRegular15.copyWith(
                  decoration: TextDecoration.lineThrough,
                  color: AppColors.lightTextColor,
                ),
              ),
            ],
          ),
          const Gap(6),
          Text(
            'وفر 11 د.إ',
            style: TextStyles.darkBold12.copyWith(color: AppColors.redColor2),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text('الكمية', style: TextStyles.blackBold14),
          const Spacer(),
          QuantityButton(
            icon: Icons.remove,
            onTap: () {
              if (_quantity > 1) setState(() => _quantity--);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('$_quantity', style: TextStyles.blackBold16),
          ),
          QuantityButton(
            icon: Icons.add,
            onTap: () => setState(() => _quantity++),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('وصف المنتج', style: TextStyles.blackBold14),
          const Gap(8),
          Text(
            'كفر حماية فاخر مصنوع من مادة البولي كربونات عالية الجودة، يوفر حماية ممتازة من الصدمات والخدوش مع الحفاظ على مظهر أنيق ورفيع.',
            style: TextStyles.greyRegular15,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return CustomButton(
      title: 'إضافة إلى السلة',
      onPressed: () {},
      backgroundColor: AppColors.primaryColor,
      textColor: Colors.white,
    );
  }
}


