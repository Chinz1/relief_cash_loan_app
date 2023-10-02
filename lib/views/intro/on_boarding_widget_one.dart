import 'package:flutter/material.dart';

import '../../components/button.dart';
import '../../services/auth_state.dart';
import '../../utils/config/text_config.dart';
import '../../utils/const.dart';
import 'components/indicator.dart';

class OnboardingWidgetOne extends StatelessWidget {
  final PageController controller;
  const OnboardingWidgetOne({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double size = defaultSize * 1.2;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, AuthState.id),
            child: const Text("Skip"),
          ),
        ],
      ),
      body: Padding(
        padding: appPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: size,
                left: size,
                right: size,
              ),
              child: const Image(
                image: AssetImage(ladyIllustrationImage),
              ),
            ),
            const SizedBox(height: 60.0),
            Text(
              "Make money\ndisbursing loans",
              textAlign: TextAlign.center,
              style: TextConfig.largeText,
            ),
            const SizedBox(height: 16.0),
            Text(
              "Give weekly loans to your network.\nMake more profit from 100% repayments",
              textAlign: TextAlign.center,
              style: TextConfig.smallText.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 42.0),
            const Indicator(isFirstPage: true),
            const SizedBox(height: 42.0),
            Button(
              child:  Text(
                "Next",
                style: TextConfig.buttonTextStyle,
              ),
              onTap: () {
                controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              },
            ),
            verticalGap,
          ],
        ),
      ),
    );
  }
}
