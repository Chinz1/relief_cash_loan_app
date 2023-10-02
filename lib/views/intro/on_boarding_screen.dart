import 'package:flutter/material.dart';
import 'on_boarding_widget_one.dart';
import 'on_boarding_widget_two.dart';

class OnBoardingScreen extends StatelessWidget {
  static String id = "/onboarding-screen";
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return PageView(
      controller: controller,
      children: [
        OnboardingWidgetOne(
          controller: controller,
        ),
        OnboardingWidgetTwo(
          controller: controller,
        ),
      ],
    );
  }
}
