import 'package:flutter/material.dart';
import 'package:news_app/features/onboarding/models/onboarding_model.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
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
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
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
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFC53030),
                        shape: BeveledRectangleBorder(),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0XFFFFFCFC),
                        ),
                      ),
                    ),
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
