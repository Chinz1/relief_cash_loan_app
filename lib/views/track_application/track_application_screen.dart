import 'package:flutter/material.dart';
import 'package:small_loans_app/components/track_application_tile.dart';
import 'package:small_loans_app/utils/config/text_config.dart';

import '../../utils/const.dart';

class TrackApplicationScreen extends StatelessWidget {
  static String id = "/track-application-screen";
  const TrackApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Track Loan",
          style: TextConfig.textStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: appPadding.add(
          EdgeInsets.only(top: paddingSize),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TrackApplicationTile(
              name: "Gbadebisi Jumoke",
              amount: "#3,000",
              status: "Loan Verified",
              descriptionText:
                  "The loan will be approved soon.Some details are being confirmed after which the loan will be disbursed in approximately 3 hours from now.\n\nKindly check back later. Thank you.",
            ),
            verticalGap,
            verticalGap,
            Text(
              "Loan Summary",
              style: TextConfig.textStyle.copyWith(fontSize: 18.0),
            ),
            SizedBox(height: paddingSize + 3),
            Text(
              "Full Name:",
              style: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: paddingSize - 5),
            Text(
              "Taiye Kehinde",
              style: TextConfig.textStyle,
            ),
            SizedBox(height: paddingSize),
            Text(
              "Phone Number:",
              style: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: paddingSize - 5),
            Text(
              "08012345678",
              style: TextConfig.textStyle,
            ),
            SizedBox(height: paddingSize),
            Text(
              "Home Address:",
              style: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: paddingSize - 5),
            Text(
              "No. 3, Zone 9, Ilorin, Kwara State",
              style: TextConfig.textStyle,
            ),
            SizedBox(height: paddingSize),
            Text(
              "Known for:",
              style: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: paddingSize - 5),
            Text(
              "5 Months",
              style: TextConfig.textStyle,
            ),
            SizedBox(height: paddingSize),
            Text(
              "Loan amount requested:",
              style: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: paddingSize - 5),
            Text(
              "#50,000",
              style: TextConfig.textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
