import 'package:flutter/material.dart';
import 'package:small_loans_app/components/button.dart';
import 'package:small_loans_app/components/outlined_button.dart';
import 'package:small_loans_app/utils/config/colour_config.dart';
import '../../components/text_field.dart';
import '../../utils/config/text_config.dart';
import '../../utils/const.dart';

class BankDetailsScreen extends StatelessWidget {
  static String id = "/bank-details-screen";
  const BankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var padding = paddingSize * 2;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bank Details",
          style: TextConfig.textStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          padding,
          padding,
          padding,
          0.0,
        ),
        child: Column(
          children: [
            const CustomTextField(
              label: "Account Number",
              hintText: "e.g 0230253866",
            ),
            const CustomTextField(
              label: "Bank Name",
              hintText: "e.g GT Bank",
            ),
            const CustomTextField(
              label: "NIN",
              hintText: "e.g 1112223334",
            ),
            const CustomTextField(
              label: "BVN",
              hintText: "e.g 8166230786",
            ),
            const CustomTextField(
              label: "ATM Card Number",
              hintText: "e.g 0112-0202-3334-1122",
            ),
            Row(
              children: [
                const Expanded(
                  child: CustomTextField(
                    label: "PIN",
                    hintText: "****",
                    obscureText: true,
                  ),
                ),
                SizedBox(width: paddingSize),
                const Expanded(
                  child: CustomTextField(
                    label: "CVV",
                    hintText: "123",
                  ),
                ),
                SizedBox(width: paddingSize),
                const Expanded(
                  flex: 2,
                  child: CustomTextField(
                    label: "Expiry date",
                    hintText: "12/22",
                  ),
                ),
              ],
            ),
            verticalGap,
            Button(
              child: Text(
                "Save Details",
                style: TextConfig.buttonTextStyle,
              ),
              onTap: () {
                // TODO: Create the necessary function
              },
            ),
            verticalGap,
            ButtonOutlined(
              borderColour: ColourConfig.defaultAppColour,
              child: Text(
                "Add New Account",
                style: TextConfig.buttonTextStyle.copyWith(
                  color: ColourConfig.defaultAppColour,
                ),
              ),
              onTap: () {
                // TODO: Create the necessary function
              },
            ),
          ],
        ),
      ),
    );
  }
}
