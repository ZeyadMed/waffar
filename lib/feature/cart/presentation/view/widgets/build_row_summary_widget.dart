import 'package:flutter/material.dart';
import 'package:waffar/core/theme/text_styles.dart';

class BuildRowSummaryWidget extends StatelessWidget {
  final String label;
  final String value;

  const BuildRowSummaryWidget(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyles.blackRegular12.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
        Text(value, style: TextStyles.blackBold14),
      ],
    );
  }
}
