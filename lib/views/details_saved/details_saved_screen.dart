import 'package:flutter/material.dart';
import 'package:small_loans_app/components/button.dart';
import 'package:small_loans_app/components/outlined_button.dart';
import 'package:small_loans_app/utils/const.dart';
import 'package:small_loans_app/views/b_nav_bar.dart';

import '../../utils/config/colour_config.dart';
import '../../utils/config/text_config.dart';

class DetailsSavedScreen extends StatelessWidget {
  static String id = "/details-saved-screen";
  const DetailsSavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: appPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline_rounded,
                size: defaultSize * 3.5,
                color: ColourConfig.defaultAppColour,
              ),
              verticalGap,
              Text(
                "Thank you, Your Application to disburse a new loan has been saved.\n\nKindly come back later to finish up the application.",
                textAlign: TextAlign.center,
                style:
                    TextConfig.textStyle.copyWith(fontWeight: FontWeight.w400),
              ),
              verticalGap,
              Button(
                child: Text(
                  "Back to Home",
                  style: TextConfig.buttonTextStyle,
                ),
                onTap: () => Navigator.popAndPushNamed(context, BNavBar.id),
              ),
              verticalGap,
              ButtonOutlined(
                onTap: () => Navigator.pop(context),
                child: Text(
                  "Continue Now",
                  style: TextConfig.buttonTextStyle.copyWith(
                    color: ColourConfig.defaultAppColour,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
