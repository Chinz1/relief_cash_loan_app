import 'package:flutter/material.dart';
import 'package:small_loans_app/components/button.dart';
import 'package:small_loans_app/utils/config/colour_config.dart';
import 'package:small_loans_app/utils/const.dart';

import '../../utils/config/text_config.dart';

class SuccessfulFundRequestScreen extends StatelessWidget {
  static String id = "/successful-fund-request-screen";
  const SuccessfulFundRequestScreen({super.key});

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
                size: 126.0,
                color: ColourConfig.defaultAppColour,
              ),
              verticalGap,
              verticalGap,
              Text(
                "Thank you, Your request for funds\nwas successfully made.\n\nIt will reflect shortly on wallet.",
                textAlign: TextAlign.center,
                style:
                    TextConfig.textStyle.copyWith(fontWeight: FontWeight.w400),
              ),
              verticalGap,
              Button(
                child: const Text(
                  "Back to Home",
                  style: kButtonTextStyle,
                ),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
