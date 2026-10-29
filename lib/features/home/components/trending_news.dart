import 'package:flutter/material.dart';
import 'package:news_app/core/enums/request_status_enum.dart';
import 'package:news_app/core/extensions/date_time_extension.dart';
import 'package:news_app/features/home/components/trending_news_shimmer.dart';
import 'package:news_app/features/home/components/view_all.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/widgets/custome_cached_network_image.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: AppSizes.h320,
        child: Stack(
          children: [
            Image.asset(
              width: double.infinity,
              height: AppSizes.h270,
              "assets/images/home_background.png",
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              top: AppSizes.h65,
              child: Column(
                children: <Widget>[
                  Text(
                    "NEWST",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: AppSizes.sp30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  ViewAll(title: "Trending News", onTap: () {}),

                  Expanded(
                    child: Consumer<HomeController>(
                      builder:
                          (BuildContext context, HomeController controller, _) {
                            switch (controller.everythingStatus) {
                              case RequestStatusEnum.loading:
                                return TrendingNewsShimmer();

                              case RequestStatusEnum.error:
                                return Center(
                                  child: Text(controller.errorMessage!),
                                );

                              case RequestStatusEnum.loaded:
                                return ListView.builder(
                                  padding: EdgeInsets.only(left: AppSizes.w8),
                                  itemCount: controller.newsEverythingList
                                      .take(6)
                                      .length,
                                  scrollDirection: Axis.horizontal,

                                  itemBuilder: (context, index) {
                                    final model =
                                        controller.newsEverythingList[index];
                                    return Padding(
                                      padding: EdgeInsets.all(AppSizes.w8),
                                      child: SizedBox(
                                        height: AppSizes.h140,
                                        width: AppSizes.w240,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            AppSizes.r12,
                                          ),
                                          child: Stack(
                                            children: [
                                              if (model.urlToImage != null)
                                                CustomCachedNetworkImage(
                                                  imagePath: model.urlToImage!,
                                                  width: AppSizes.w240,
                                                  height: AppSizes.h150,
                                                ),
                                              Positioned.fill(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Colors.black.withValues(
                                                          alpha: 0.2,
                                                        ),
                                                        Colors.black.withValues(
                                                          alpha: 0.4,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: AppSizes.w10,
                                                right: AppSizes.w10,
                                                top: AppSizes.h70,
                                                bottom: AppSizes.h12,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      model.title,
                                                      style: Theme.of(
                                                        context,
                                                      ).textTheme.labelMedium,
                                                    ),
                                                    SizedBox(
                                                      height: AppSizes.h4,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        CircleAvatar(
                                                          backgroundImage:
                                                              NetworkImage(
                                                                model.urlToImage
                                                                    .toString(),
                                                              ),
                                                          radius: AppSizes.r12,
                                                        ),
                                                        SizedBox(
                                                          width: AppSizes.w4,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            model.author,
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .titleSmall!
                                                                .copyWith(
                                                                  color: Color(
                                                                    0xFFFFFCFC,
                                                                  ),
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          model.publishedAt
                                                              .formatDate(),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,

                                                          style: Theme.of(
                                                            context,
                                                          ).textTheme.bodySmall,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                            }
                          },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
