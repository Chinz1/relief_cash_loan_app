import 'package:flutter/material.dart';
import 'package:small_loans_app/utils/config/colour_config.dart';
import 'package:small_loans_app/utils/const.dart';
import 'package:small_loans_app/utils/loading_function.dart';
import 'package:small_loans_app/views/loan_application/loan_application_screen_one.dart';
import '../../components/loan_tile.dart';
import '../../utils/config/text_config.dart';
import '../denied_loan/denied_loan_screen.dart';
import '../track_application/track_application_screen.dart';

class AllApplicationsScreen extends StatelessWidget {
  static String id = "/all-applications-scren";
  const AllApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Applications",
          style: TextConfig.textStyle,
        ),
      ),
      body: ListView(
        padding: appPadding,
        children: [
          LoanTile(
            name: "Gbadebisi Jumoke",
            amount: "#3,000",
            status: "Loan Verified",
            buttonText: "Track Application",
            onTap: () => moveToNextScreen(
              context: context,
              routeName: TrackApplicationScreen.id,
            ),
          ),
          LoanTile(
            name: "Olabisi Biyi",
            amount: "#5,000",
            status: "Disburesment in progress",
            buttonText: "Track Application",
            date: "10/08/2022",
            onTap: () => moveToNextScreen(
              context: context,
              routeName: TrackApplicationScreen.id,
            ),
          ),
          LoanTile(
            name: "Adetola Adebimpe",
            amount: "#3,000",
            status: "Loan denied",
            statusColour: ColourConfig.redColour,
            buttonText: "Review Application",
            date: "04/08/2022",
            onTap: () => moveToNextScreen(
              context: context,
              routeName: DeniedLoanScreen.id,
            ),
          ),
          LoanTile(
            name: "Adetola Adebimpe",
            amount: "#5,000",
            status: "2/3 steps completed",
            buttonText: "Continue Application",
            onTap: () => moveToNextScreen(
              context: context,
              routeName: LoanApplicationScreenOne.id,
            ),
          ),
          LoanTile(
            name: "Gbadebisi Jumoke",
            amount: "#3,000",
            status: "2/3 steps completed",
            buttonText: "Continue Application",
            onTap: () => moveToNextScreen(
              context: context,
              routeName: LoanApplicationScreenOne.id,
            ),
          ),
        ],
      ),
    );
  }

  void moveToNextScreen({
    required BuildContext context,
    required String routeName,
  }) async {
    await LoadingFunction.load(context: context);
    if (context.mounted) {
      Navigator.pushNamed(context, routeName);
    }
  }
}
