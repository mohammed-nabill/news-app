import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/core/enums/request_status_enum.dart';
import 'package:news_app/core/extensions/date_time_extension.dart';
import 'package:news_app/features/home/components/top_headline_shimmer.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/custome_cached_network_image.dart';

class TopHeadline extends StatelessWidget {
  const TopHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, HomeController controller, child) {
        switch (controller.topHeadlineStatus) {
          case RequestStatusEnum.loading:
            return TopHeadlineShimmer();
          case RequestStatusEnum.error:
            return SliverToBoxAdapter(
              child: Center(child: Text(controller.errorMessage!)),
            );
          case RequestStatusEnum.loaded:
            return SliverList.builder(
              itemCount: controller.newsTopHeadlineList.length,
              itemBuilder: (BuildContext context, int index) {
                final model = controller.newsTopHeadlineList[index];
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
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
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
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleSmall,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      model.publishedAt.formatDate(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: const Color(0xFF363636),
                                          ),
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
              },
            );
        }
      },
    );
  }
}
