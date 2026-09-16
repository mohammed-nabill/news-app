import 'package:flutter/material.dart';
import 'package:news_app/features/onboarding/controller/onboarding_controller.dart';
import 'package:news_app/features/onboarding/models/onboarding_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingController(),
      builder: (context, _) {
        final OnboardingController controller = context
            .read<OnboardingController>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFF5F5F5),
            actions: [
              Consumer<OnboardingController>(
                builder: (BuildContext context, OnboardingController value, _) {
                  return !value.lastPage
                      ? Align(
                          alignment: AlignmentGeometry.centerRight,
                          child: TextButton(
                            onPressed: () {
                              value.pageController.animateToPage(
                                OnboardingModel.onboardingList.length - 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                      : SizedBox();
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: (index) {
                        controller.onPageChanged(index);
                      },
                      itemCount: OnboardingModel.onboardingList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final OnboardingModel model =
                            OnboardingModel.onboardingList[index];
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsetsGeometry.fromLTRB(
                                23,
                                24,
                                23,
                                24,
                              ),
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
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                  Consumer<OnboardingController>(
                    builder:
                        (BuildContext context, OnboardingController value, _) {
                          return SmoothPageIndicator(
                            controller: controller.pageController,
                            count: 3,
                            effect: WormEffect(
                              activeDotColor: Color(0xFFC53030),
                            ),
                          );
                        },
                  ),
                  SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      controller.pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 52),
                    ),
                    child: Consumer<OnboardingController>(
                      builder:
                          (
                            BuildContext context,
                            OnboardingController value,
                            _,
                          ) {
                            return Text(
                              value.lastPage ? "Get Started" : "Next",
                            );
                          },
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
}
