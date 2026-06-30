import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waffar/core/router/app_router.dart';
import 'package:waffar/core/style/assets.dart';
import 'package:waffar/feature/home/presentation/view/widgets/department_every_one_look_for_widget.dart';

class HomeEveryoneSearchingWidget extends StatelessWidget {
  const HomeEveryoneSearchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: DepartmentEveryOneLookForWidget(
              onTap: () => context.push(AppRouter.productDetailsScreen),
              image: Assets.assetsImagesTv,
              name: 'Product 1',
              price: '\$100',
              discountPrice: '\$80',
            ),
          ),
        ),
      ),
    );
  }
}
