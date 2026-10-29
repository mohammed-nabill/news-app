import 'package:flutter/material.dart';
import 'package:news_app/features/home/categories_screen.dart';
import 'package:news_app/features/home/components/view_all.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_sizes.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<HomeController>(
        builder:
            (BuildContext context, HomeController controller, Widget? child) {
              return Column(
                children: [
                  ViewAll(
                    title: "Categories",
                    textColorBlack: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ChangeNotifierProvider.value(
                              value: controller,
                              child: CategoriesScreen(),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: AppSizes.w16,
                      bottom: AppSizes.h16,
                      top: AppSizes.h4,
                    ),
                    child: SizedBox(
                      height: AppSizes.h40,
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
                                    SizedBox(height: AppSizes.h6),
                                    Container(
                                      height: AppSizes.h2,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: AppSizes.w12);
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
      ),
    );
  }
}

final List<String> categories = [
  "business",
  "entertainment",
  "general",
  "health",
  "science",
  "sports",
  "technology",
];
