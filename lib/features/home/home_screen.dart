import 'package:flutter/material.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (_) => HomeController()..init(),
      builder: (context, child) {
        return Scaffold(
          body: Consumer<HomeController>(
            builder: (BuildContext context, HomeController value, _) {
              return (value.errorMessage?.isNotEmpty ?? false)
                  ? Center(child: Text(value.errorMessage!))
                  : value.everythingLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: value.newsTopHeadlineList.length,
                            itemBuilder: (context, index) {
                              return Text(
                                value.newsTopHeadlineList[index].title,
                              );
                            },
                          ),
                        ),
                      ],
                    );
            },
          ),
        );
      },
    );
  }
}
