import 'package:flutter/material.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

import 'components/categories_list.dart';
import 'components/news_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories"), centerTitle: true),
      body: Consumer<HomeController>(
        builder:
            (BuildContext context, HomeController controller, Widget? child) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      bottom: 16,
                      top: 20,
                    ),
                    child: SizedBox(
                      height: 40,
                      child: ListView.separated(
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          controller.selectedCategory ??= categories[0];
                          return GestureDetector(
                            onTap: () {
                              controller.updateSelectedCategory(
                                categories[index],
                              );
                            },
                            child: IntrinsicWidth(
                              child: Column(
                                children: [
                                  Text(
                                    categories[index][0].toUpperCase() +
                                        categories[index].substring(1),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: Color(0xFF363636)),
                                  ),
                                  if (controller.selectedCategory ==
                                      categories[index]) ...[
                                    SizedBox(height: 6),
                                    Container(
                                      height: 2,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 12);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.newsTopHeadlineList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final model = controller.newsTopHeadlineList[index];
                        return NewsItem(model: model);
                      },
                    ),
                  ),
                ],
              );
            },
      ),
    );
  }
}
