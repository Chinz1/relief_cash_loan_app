import 'package:flutter/material.dart';
import 'package:small_loans_app/components/button.dart';
import 'package:small_loans_app/components/dropdown_text_field.dart';
import 'package:small_loans_app/utils/config/colour_config.dart';
import 'package:small_loans_app/utils/config/text_config.dart';

import '../../utils/const.dart';

class ReportIssuesScreen extends StatelessWidget {
  static String id = "/report-issues-screen";
  const ReportIssuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report Issues",
          style: TextConfig.textStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: appPadding,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Complaint/Issues"),
                  hintText:
                      "Kindly describe the issue here or choose any of the common issues below"),
              maxLines: 10,
            ),
            verticalGap,
            Button(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Report ",
                      style: TextConfig.textStyle
                          .copyWith(color: ColourConfig.whiteColour),
                    ),
                    const SizedBox(width: 8.0),
                    const Icon(Icons.arrow_forward_outlined),
                  ],
                ),
                onTap: () {
                  // TODO: Create the necessary function
                }),
            verticalGap,
            verticalGap,
            const CustomDropdownTextField(
              hintText: "Choose from common issues",
              label: "What issue are you facing?",
              items: [
                DropdownMenuItem(
                  value: "Unresponsive invitee",
                  child: Text("Unresponsive invitee"),
                ),
                DropdownMenuItem(
                  value: "Continuous Loan error",
                  child: Text("Continuous Loan error"),
                ),
                DropdownMenuItem(
                  value: "Others",
                  child: Text("Others"),
                ),
                DropdownMenuItem(
                  value: "Due for next level",
                  child: Text("Due for next level"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
