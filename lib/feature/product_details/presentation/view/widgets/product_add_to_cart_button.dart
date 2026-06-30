import 'package:waffar/core/helper/helper.dart';
import 'package:waffar/core/widget/custom_button.dart';

class ProductAddToCartButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProductAddToCartButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: 'اطلبه الان',
      onPressed: onPressed,
      backgroundColor: AppColors.primaryColor,
      textColor: Colors.white,
    );
  }
}
