import 'package:flutter/material.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

import 'components/trending_news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (_) => HomeController()..init(),
      builder: (context, child) {
        return Scaffold(
          body: Consumer<HomeController>(
            builder: (BuildContext context, HomeController controller, _) {
              return Column(children: [TrendingNews()]);
            },
          ),
        );
      },
    );
  }
}
