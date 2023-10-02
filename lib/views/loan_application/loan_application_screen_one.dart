import 'package:flutter/material.dart';
import 'package:small_loans_app/components/button.dart';
import 'package:small_loans_app/components/text_field.dart';
import 'package:small_loans_app/utils/config/colour_config.dart';
import 'package:small_loans_app/utils/loading_function.dart';
import 'package:small_loans_app/views/loan_application/components/page_indicator.dart';
import 'package:small_loans_app/views/loan_application/loan_application_screen_two.dart';
import '../../components/dropdown_text_field.dart';
import '../../utils/config/text_config.dart';
import '../../utils/const.dart';
import '../details_saved/details_saved_screen.dart';

class LoanApplicationScreenOne extends StatelessWidget {
  static String id = "/loan-application-screen-one";
  const LoanApplicationScreenOne({super.key});

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
                text: "(Basic Details of Beneficiary)",
                style: TextConfig.smallText.copyWith(
                  fontWeight: FontWeight.w500,
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
              label: "Full Name",
              hintText: "e.g Taiye Kehinde",
              prefixIcon: Icon(Icons.person),
            ),
            const CustomTextField(
              label: "Email Address",
              hintText: "e.g taiyekehinde@gmail.com",
              prefixIcon: Icon(Icons.email),
            ),
            const CustomTextField(
              label: "Phone Number",
              hintText: "e.g 08012345678",
              prefixIcon: Icon(Icons.phone),
            ),
            const CustomTextField(
              label: "Home address",
              hintText: "e.g No. 3, Zone 9, Ilorin, Kwara State",
              prefixIcon: Icon(Icons.location_on),
            ),
            const CustomDropdownTextField(
              label: "How long have you known him/her?",
              hintText: "e.g 3 Months",
              items: [
                DropdownMenuItem(
                  value: "3-6 Month",
                  child: Text("3-6 Month"),
                ),
                DropdownMenuItem(
                  value: "7-12 Month",
                  child: Text("7-12 Month"),
                ),
                DropdownMenuItem(
                  value: "Over a Year",
                  child: Text("Over a Year"),
                ),
                DropdownMenuItem(
                  value: "Over 3 Years",
                  child: Text("Over 3 Years"),
                ),
              ],
            ),
            const CustomDropdownTextField(
              label: "How much loan does he/she need?",
              hintText: "e.g #5,000",
              items: [
                DropdownMenuItem(
                  value: "#3,000",
                  child: Text("#3,000"),
                ),
                DropdownMenuItem(
                  value: "#5,000",
                  child: Text("#5,000"),
                ),
              ],
            ),
            Button(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Next",
                    style: TextConfig.textStyle.copyWith(
                      color: ColourConfig.whiteColour,
                    ),
                  ),
                  SizedBox(width: paddingSize),
                  const Icon(Icons.arrow_forward_outlined),
                ],
              ),
              onTap: () => moveToNextScreen(
                context: context,
                routeName: LoanApplicationScreenTwo.id,
              ),
            ),
            SizedBox(height: paddingSize),
            TextButton(
              onPressed: () async {
                await LoadingFunction.load(context: context);
                if (context.mounted) {
                  Navigator.pushNamed(context, DetailsSavedScreen.id);
                }
              },
              child: Text(
                "Continue Later",
                style: kButtonTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColourConfig.defaultAppColour,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: paddingSize),
            const CustomPageIndicator(
              isPageOne: true,
              isPageTwo: false,
              isPageThree: false,
            ),
            SizedBox(height: paddingSize),
          ],
        ),
      ),
    );
  }
}
