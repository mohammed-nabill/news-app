import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/core/extensions/date_time_extension.dart';

import '../../../core/widgets/custome_cached_network_image.dart';
import '../models/news_article_model.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.model});

  final NewsArticleModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              model.urlToImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CustomCachedNetworkImage(
                        imagePath: model.urlToImage!,
                      ),
                    )
                  : SizedBox(width: 140, height: 70),
              const SizedBox(width: 8),

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

                    const SizedBox(height: 2),

                    Row(
                      children: [
                        if (model.urlToImage != null)
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                              model.urlToImage ?? "",
                            ),
                          ),

                        const SizedBox(width: 4),
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
                        const SizedBox(width: 8),
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
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
