import 'package:flutter/material.dart';
import 'package:small_loans_app/components/track_application_tile.dart';

import '../../utils/config/colour_config.dart';
import '../../utils/config/text_config.dart';
import '../../utils/const.dart';

class DeniedLoanScreen extends StatelessWidget {
  static String id = "/denied-loan-screen";
  const DeniedLoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double padding = paddingSize * 2;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Loan Details",
          style: TextConfig.textStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: padding,
          top: padding,
          right: padding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrackApplicationTile(
              name: "Gbadebisi Jumoke",
              amount: "#3,000",
              status: "Loan Denied",
              statusColour: ColourConfig.redColour,
              descriptionText:
                  "The loan was denied because someone else in your direct link has also requested for a loan and is yet to refund it.\n\nTwo people in the same direct link can't request for loan at the same time.\n\nKindly check back later. Thank you.",
            ),
            verticalGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline,
                  color: ColourConfig.redColour,
                ),
                SizedBox(width: paddingSize / 2),
                Text(
                  "Kindly wait for the other person to refund theirs. Thanks",
                  style: TextConfig.smallText.copyWith(
                    color: ColourConfig.redColour,
                  ),
                ),
              ],
            ),
            SizedBox(height: padding),
            Text(
              "Loan Summary",
              style: TextConfig.textStyle.copyWith(fontSize: 18.0),
            ),
            SizedBox(height: paddingSize * 1.6),
            buildInfo(
              key: 'Full Name',
              value: 'Taiye Kehinde',
            ),
            buildInfo(
              key: 'Phone Number',
              value: '08012345678',
            ),
            buildInfo(
              key: 'Home Address',
              value: 'No. 3, Zone 9, Ilorin, Kwara State',
            ),
            buildInfo(
              key: 'Known for',
              value: '5 Months',
            ),
            buildInfo(
              key: 'Loan amount requested',
              value: '#50,000',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfo({required String key, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$key:",
          style: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w400),
        ),
        SizedBox(height: paddingSize / 2),
        Text(
          value,
          style: TextConfig.textStyle,
        ),
        SizedBox(height: paddingSize),
      ],
    );
  }
}