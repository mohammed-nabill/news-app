import 'package:flutter/material.dart';
import 'package:news_app/core/enums/request_status_enum.dart';
import 'package:news_app/features/home/components/view_all.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Stack(
        children: [
          Image.asset(
            width: double.infinity,
            height: 270,
            "assets/images/home_background.png",
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            top: 65.0,
            child: Column(
              children: <Widget>[
                Text(
                  "NEWST",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
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
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );

                            case RequestStatusEnum.error:
                              return Center(
                                child: Text(controller.errorMessage!),
                              );

                            case RequestStatusEnum.loaded:
                              return ListView.builder(
                                padding: const EdgeInsets.only(left: 16.0),
                                itemCount: controller.newsEverythingList
                                    .take(6)
                                    .length,
                                scrollDirection: Axis.horizontal,

                                itemBuilder: (context, index) {
                                  final model =
                                      controller.newsEverythingList[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 140,
                                      width: 240,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          12.0,
                                        ),
                                        child: Stack(
                                          children: [
                                            if (model.urlToImage != null)
                                              Image.network(
                                                model.urlToImage!,
                                                fit: BoxFit.cover,
                                                width: 240,
                                                height: 150,
                                              ),
                                            Positioned.fill(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
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
                                              left: 10,
                                              right: 10,
                                              top: 70,
                                              bottom: 12,
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
                                                  SizedBox(height: 4),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                              model.urlToImage
                                                                  .toString(),
                                                            ),
                                                        radius: 12,
                                                      ),
                                                      SizedBox(width: 4),
                                                      Expanded(
                                                        child: Text(
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          model.author,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        formatDate(
                                                          model.publishedAt,
                                                        ),
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
    );
  }

  String formatDate(String? date) {
    if (date == null) return "";
    final diff = DateTime.now().difference(DateTime.parse(date));
    if (diff.inMinutes <= 60) return "${diff.inMinutes}m ago";
    if (diff.inHours <= 24) return "${diff.inHours}h ago";
    return "${diff.inDays}d ago";
  }
}
