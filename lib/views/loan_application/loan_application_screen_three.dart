import 'package:flutter/material.dart';
import 'package:small_loans_app/components/text_field.dart';
import 'package:small_loans_app/utils/config/colour_config.dart';
import 'package:small_loans_app/views/loan_application/components/page_indicator.dart';
import '../../components/acknowledgement_tile.dart';
import '../../components/button.dart';
import '../../utils/config/text_config.dart';
import '../../utils/const.dart';
import '../successful_loan_application/successful_loan_application_screen.dart';

class LoanApplicationScreenThree extends StatefulWidget {
  static String id = "/loan-application-screen-three";
  const LoanApplicationScreenThree({super.key});

  @override
  State<LoanApplicationScreenThree> createState() =>
      _LoanApplicationScreenThreeState();
}

class _LoanApplicationScreenThreeState
    extends State<LoanApplicationScreenThree> {
  bool? isMerchantChecked = false;
  bool? isBeneficiaryChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Confirm Loan Request",
          style: TextConfig.textStyle,
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
            AcknowledgementTile(
              isChecked: isMerchantChecked,
              onChanged: (value) {
                setState(() {
                  isMerchantChecked = value;
                });
              },
              person: "the merchant",
            ),
            SizedBox(height: paddingSize),
            AcknowledgementTile(
              isChecked: isBeneficiaryChecked,
              onChanged: (value) {
                setState(() {
                  isBeneficiaryChecked = value;
                });
              },
              person: "the beneficiary",
            ),
            SizedBox(height: paddingSize),
            Visibility(
              visible: !isMerchantChecked! || !isBeneficiaryChecked!,
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: ColourConfig.redColour,
                  ),
                  Text(
                    "Kindly agree to all",
                    style: TextConfig.textStyle.copyWith(
                      color: ColourConfig.redColour,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: paddingSize * 2),
            const CustomTextField(
              label: "OTP sent to merchant",
              hintText: "e.g 1234",
            ),
            const CustomTextField(
              label: "OTP sent to beneficiary",
              hintText: "e.g 1234",
            ),
            const CustomTextField(
              label: "Invitation code",
              hintText: "e.g 1234-AB-09",
            ),
            SizedBox(height: paddingSize * 3),
            Button(
              onTap: isMerchantChecked! && isBeneficiaryChecked!
                  ? () => moveToNextScreen(
                        context: context,
                        routeName: SuccessfulLoanApplicationScreen.id,
                      )
                  : () {
                      /// Do nothing if the Terms & Condition are not accepted
                    },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Request Loan",
                    style: TextConfig.textStyle
                        .copyWith(color: ColourConfig.whiteColour),
                  ),
                  SizedBox(width: paddingSize),
                  const Icon(Icons.arrow_forward_outlined),
                ],
              ),
            ),
            SizedBox(height: paddingSize * 3),
            const CustomPageIndicator(
              isPageOne: false,
              isPageTwo: false,
              isPageThree: true,
            ),
          ],
        ),
      ),
    );
  }
}
