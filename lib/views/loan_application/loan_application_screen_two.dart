import 'package:flutter/material.dart';
import 'package:small_loans_app/components/button.dart';
import 'package:small_loans_app/components/text_field.dart';
import 'package:small_loans_app/utils/config/colour_config.dart';
import 'package:small_loans_app/views/loan_application/components/page_indicator.dart';
import 'package:small_loans_app/views/loan_application/loan_application_screen_three.dart';
import '../../utils/config/text_config.dart';
import '../../utils/const.dart';
import '../details_saved/details_saved_screen.dart';

class LoanApplicationScreenTwo extends StatelessWidget {
  static String id = "/loan-application-screen-two";
  const LoanApplicationScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: "Loan Application ",
            style: TextConfig.textStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
              color: ColourConfig.blackColour,
            ),
            children: [
              TextSpan(
                text: "(Bank Details of Beneficiary)",
                style: TextConfig.textStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                  color: ColourConfig.blackColour,
                  fontFamily: 'Yaldevi',
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: appPadding.add(
          EdgeInsets.only(
            top: paddingSize * 2,
          ),
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
            Button(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Next",
                    style: TextConfig.textStyle
                        .copyWith(color: ColourConfig.whiteColour),
                  ),
                  const SizedBox(width: 8.0),
                  const Icon(Icons.arrow_forward_outlined),
                ],
              ),
              onTap: () => moveToNextScreen(
                context: context,
                routeName: LoanApplicationScreenThree.id,
              ),
            ),
            SizedBox(height: paddingSize),
            TextButton(
              onPressed: () => moveToNextScreen(
                context: context,
                routeName: DetailsSavedScreen.id,
              ),
              child: Text(
                "Continue Later",
                style: TextConfig.buttonTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColourConfig.defaultAppColour,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(width: paddingSize + 3),
            const CustomPageIndicator(
              isPageOne: false,
              isPageTwo: true,
              isPageThree: false,
            ),
            SizedBox(height: paddingSize),
          ],
        ),
      ),
    );
  }
}
