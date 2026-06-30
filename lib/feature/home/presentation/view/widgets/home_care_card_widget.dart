import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waffar/core/theme/text_styles.dart';
import 'package:waffar/core/widget/flexiable_image.dart';
import 'package:waffar/feature/home/presentation/view/widgets/personal_care_items.dart';

class HomeCareCardWidget extends StatelessWidget {
  final PersonalCareItem item;

  const HomeCareCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.15),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FlexibleImage(source: item.image, fit: BoxFit.contain),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: FittedBox(
              child: Text(
                item.title.tr(),
                textAlign: TextAlign.center,
                style: TextStyles.blackBold14.copyWith(fontSize: 13, height: 1.3),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
