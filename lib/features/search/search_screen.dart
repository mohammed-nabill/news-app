import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Search"), centerTitle: true),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w16,
              vertical: AppSizes.h20,
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Search",
                suffixIcon: Icon(
                  Icons.search,
                  color: Color(0xFFA0A0A0),
                  size: AppSizes.r30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
