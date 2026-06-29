import 'package:flutter/material.dart';
import 'package:waffar/core/extension/context_extension.dart';
import 'package:waffar/core/widget/flexiable_image.dart';

class CategoryItem {
  final String image;

  const CategoryItem({required this.image});
}

class CategoryGridWidget extends StatelessWidget {
  final List<CategoryItem> items;

  const CategoryGridWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final rows = <List<CategoryItem>>[];
    for (var i = 0; i < items.length; i += 2) {
      rows.add(items.sublist(i, i + 2 > items.length ? items.length : i + 2));
    }

    return Column(
      children: rows.map((row) {
        return Row(
          children: row.map((item) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: _CategoryCard(item: item),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final CategoryItem item;

  const _CategoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return FlexibleImage(
      source: item.image,
      width: context.screenWidth * 0.5,
      height: context.screenHeight * 0.1,
      fit: BoxFit.cover,
      borderRadius: 15,
    );
  }
}
