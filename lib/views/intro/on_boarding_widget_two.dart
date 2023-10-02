import 'package:flutter/material.dart';

import '../../components/button.dart';
import '../../services/auth_state.dart';
import '../../utils/config/text_config.dart';
import '../../utils/const.dart';
import 'components/indicator.dart';

class OnboardingWidgetTwo extends StatelessWidget {
  final PageController controller;
  const OnboardingWidgetTwo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double size = defaultSize * 1.2;
    double verticalSpace = defaultSize * 1.67;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: buildIconButton(),
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
                image: AssetImage(phoneIllustrationImage),
              ),
            ),
            SizedBox(height: verticalSpace),
            Text(
              "Social trust-led\nprocess",
              textAlign: TextAlign.center,
              style: TextConfig.largeText,
            ),
            const SizedBox(height: 16.0),
            Text(
              "Invite traders you trust only, for continual\naccess to capital.",
              textAlign: TextAlign.center,
              style: TextConfig.smallText.copyWith(fontSize: 14.0),
            ),
            SizedBox(height: verticalSpace / 1.5),
            const Indicator(isFirstPage: false),
            SizedBox(height: size),
            Button(
              child: Text(
                "Get Started",
                style: TextConfig.buttonTextStyle,
              ),
              onTap: () => Navigator.pushNamed(context, AuthState.id),
            ),
            verticalGap,
          ],
        ),
      ),
    );
  }

  IconButton buildIconButton() {
    return IconButton(
      onPressed: () {
        controller.previousPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      },
      icon: const Icon(
        Icons.arrow_back_outlined,
      ),
    );
  }
}
