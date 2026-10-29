import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/core/extensions/date_time_extension.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/custome_cached_network_image.dart';
import '../models/news_article_model.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.model});

  final NewsArticleModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              model.urlToImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(AppSizes.r4),
                      child: CustomCachedNetworkImage(
                        imagePath: model.urlToImage!,
                      ),
                    )
                  : SizedBox(width: AppSizes.w140, height: AppSizes.h70),
              SizedBox(width: AppSizes.w8),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    SizedBox(height: AppSizes.h2),

                    Row(
                      children: [
                        if (model.urlToImage != null)
                          CircleAvatar(
                            radius: AppSizes.r12,
                            backgroundImage: NetworkImage(
                              model.urlToImage ?? "",
                            ),
                          ),

                        SizedBox(width: AppSizes.w4),
                        Expanded(
                          child: Text(
                            model.author.substring(
                              0,
                              min(model.author.length, 10),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        SizedBox(width: AppSizes.w8),
                        Text(
                          model.publishedAt.formatDate(),
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(color: const Color(0xFF363636)),
                        ),
                        Spacer(),
                        Icon(Icons.bookmark_border_outlined),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.h12),
        ],
      ),
    );
  }
}
