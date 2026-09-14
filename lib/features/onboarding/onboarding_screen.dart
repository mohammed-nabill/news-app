import 'package:flutter/material.dart';
import 'package:news_app/features/onboarding/models/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int? currentIndex;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        actions: [
          if (currentIndex != 2)
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: TextButton(
                onPressed: () {
                  controller.animateToPage(
                    OnboardingModel.onboardingList.length,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  "Skip",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemCount: OnboardingModel.onboardingList.length,
          itemBuilder: (BuildContext context, int index) {
            final OnboardingModel model = OnboardingModel.onboardingList[index];
            return Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.fromLTRB(23, 24, 23, 24),
                    child: Image.asset(model.image),
                  ),
                  Text(
                    model.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0Xff4E4B66),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    textAlign: TextAlign.center,
                    model.description,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0Xff6E7191),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 52),
                    ),
                    child: Text("Next"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
