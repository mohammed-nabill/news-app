import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/app_sizes.dart';

class TrendingNewsShimmer extends StatelessWidget {
  const TrendingNewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: AppSizes.w8),
      itemCount: 6,
      scrollDirection: Axis.horizontal,

      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(AppSizes.w8),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              color: Colors.white,
              height: AppSizes.h140,
              width: AppSizes.w240,
            ),
          ),
        );
      },
    );
  }
}
