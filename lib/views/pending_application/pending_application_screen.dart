import 'package:flutter/material.dart';
import 'package:small_loans_app/components/loan_tile.dart';
import 'package:small_loans_app/utils/config/colour_config.dart';
import 'package:small_loans_app/utils/loading_function.dart';

import '../../utils/config/text_config.dart';
import '../denied_loan/denied_loan_screen.dart';
import '../track_application/track_application_screen.dart';

class PendingApplicationScreen extends StatelessWidget {
  static String id = "/pending-application-screen";
  const PendingApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Pending Applications",
          style: TextConfig.textStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoanTile(
              name: "Gbadebisi Jumoke",
              amount: "#3,000",
              status: "Loan Verified",
              buttonText: "Track Application",
              onTap: () async {
                await LoadingFunction.load(context: context);
                if (context.mounted) {
                  Navigator.pushNamed(context, TrackApplicationScreen.id);
                }
              },
            ),
            LoanTile(
              name: "Olabisi Biyi",
              amount: "#5,000",
              status: "Disburesment in progress",
              buttonText: "Track Application",
              date: "10/08/2022",
              onTap: () async {
                await LoadingFunction.load(context: context);
                if (context.mounted) {
                  Navigator.pushNamed(context, TrackApplicationScreen.id);
                }
              },
            ),
            LoanTile(
              name: "Gbadebisi Jumoke",
              amount: "#3,000",
              status: "Loan denied",
              statusColour: ColourConfig.redColour,
              buttonText: "Review Application",
              date: "04/08/2022",
              onTap: () async {
                await LoadingFunction.load(context: context);
                if (context.mounted) {
                  Navigator.pushNamed(context, DeniedLoanScreen.id);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
