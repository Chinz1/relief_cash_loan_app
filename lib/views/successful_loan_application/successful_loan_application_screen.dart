import 'package:flutter/material.dart';
import 'package:small_loans_app/utils/config/colour_config.dart';
import 'package:small_loans_app/utils/const.dart';

import '../../components/button.dart';
import '../../utils/config/text_config.dart';
import '../b_nav_bar.dart';

class SuccessfulLoanApplicationScreen extends StatelessWidget {
  static String id = "/successful-loan-application-screen";
  const SuccessfulLoanApplicationScreen({super.key});

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
              Text(
                "Thank you, Your Application to disburse a new loan has been successfully made.",
                textAlign: TextAlign.center,
                style:
                    TextConfig.textStyle.copyWith(fontWeight: FontWeight.w400),
              ),
              verticalGap,
              Text(
                "You will be notified when it’s approved and the loan will be disbursed.",
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
            ],
          ),
        ),
      ),
    );
  }
}
