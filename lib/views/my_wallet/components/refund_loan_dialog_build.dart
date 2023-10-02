import 'package:flutter/material.dart';

import '../../../components/alert_dialog.dart';
import '../../../components/button.dart';
import '../../../components/text_field.dart';
import '../../../utils/config/colour_config.dart';
import '../../../utils/config/text_config.dart';

CustomAlertDialog buildRefundLoanDialog() {
  return CustomAlertDialog(
    title: "Refund Wallet",
    introText:
        "To refund loan, funds will be deducted from your connected bank account. Make sure you have enough to complete the refund.",
    content: Column(
      children: [
        Button(
          child: Text(
            "Refund in full",
            style: TextConfig.buttonTextStyle,
          ),
          onTap: () {
            // TODO: Create the necessary function
          },
        ),
        const SizedBox(height: 12.0),
        Text(
          "OR",
          style: TextConfig.textStyle
              .copyWith(color: ColourConfig.defaultAppColour),
        ),
        const SizedBox(height: 12.0),
        const Material(
          child: CustomTextField(
            label: "Enter amount to be refunded",
            hintText: "",
          ),
        ),
        Button(
          padding: 0.0,
          onTap: () {
            // TODO: Create the necessary function
          },
          child: Text(
            "Non-full Refund",
            style: TextConfig.buttonTextStyle,
          ),
        ),
      ],
    ),
  );
}
