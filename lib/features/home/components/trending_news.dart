import 'package:flutter/material.dart';
import 'package:news_app/core/enums/request_status_enum.dart';
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
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Trending News",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "View all",
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFFFFCFC),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
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
                                  itemCount:
                                      controller.newsEverythingList.length,
                                  scrollDirection: Axis.horizontal,

                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          12.0,
                                        ),
                                        child: SizedBox(
                                          child: Stack(
                                            children: [
                                              if (controller
                                                      .newsEverythingList[index]
                                                      .urlToImage !=
                                                  null)
                                                Image.network(
                                                  controller
                                                      .newsEverythingList[index]
                                                      .urlToImage!,
                                                  fit: BoxFit.fill,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
