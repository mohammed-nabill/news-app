import 'package:flutter/material.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 24, top: 12),
      child: SizedBox(
        height: 40,
        child: Consumer<HomeController>(
          builder:
              (BuildContext context, HomeController controller, Widget? child) {
                return ListView.separated(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    controller.selectedCategory ??= categories[0];
                    return GestureDetector(
                      onTap: () {
                        controller.updateSelectedCategory(categories[index]);
                      },
                      child: IntrinsicWidth(
                        child: Column(
                          children: [
                            Text(
                              categories[index][0].toUpperCase() +
                                  categories[index].substring(1),
                              style: Theme.of(context).textTheme.titleMedium!
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
                );
              },
        ),
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
