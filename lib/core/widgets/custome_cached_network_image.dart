import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
  });

  final String imagePath;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      width: width ?? 140,
      height: height ?? 70,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SizedBox(width: width ?? 140, height: height ?? 70),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.cover,
    );
  }
}
