import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TrendingNewsShimmer extends StatelessWidget {
  const TrendingNewsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 8.0),
      itemCount: 6,
      scrollDirection: Axis.horizontal,

      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(color: Colors.white, height: 140, width: 240),
          ),
        );
      },
    );
  }
}
