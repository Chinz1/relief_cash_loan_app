import 'package:flutter/material.dart';
import 'package:small_loans_app/components/loan_tile.dart';
import 'package:small_loans_app/utils/const.dart';
import '../../utils/config/text_config.dart';
import '../../utils/loading_function.dart';
import '../loan_application/loan_application_screen_one.dart';

class SavedApplicationScreen extends StatelessWidget {
  static String id = "/saved-application-screen";
  const SavedApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Saved Applications",
          style: TextConfig.textStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: appPadding,
        child: Column(
          children: [
            LoanTile(
              name: "Gbadebisi Jumoke",
              amount: "#3,000",
              status: "2/3 steps completed",
              buttonText: "Continue Application",
              onTap: () async {
                await LoadingFunction.load(context: context);
                if (context.mounted) {
                  Navigator.pushNamed(context, LoanApplicationScreenOne.id);
                }
              },
            ),
            LoanTile(
              name: "Olabisi Jumoke",
              amount: "#5,000",
              status: "1/3 steps completed",
              buttonText: "Continue Application",
              date: "10/08/2022",
              onTap: () async {
                await LoadingFunction.load(context: context);
                if (context.mounted) {
                  Navigator.pushNamed(context, LoanApplicationScreenOne.id);
                }
              },
            ),
            LoanTile(
              name: "Adetola Adebimpe",
              amount: "#5,000",
              status: "2/3 steps completed",
              buttonText: "Continue Application",
              onTap: () async {
                await LoadingFunction.load(context: context);
                if (context.mounted) {
                  Navigator.pushNamed(context, LoanApplicationScreenOne.id);
                }
              },
            ),
            LoanTile(
              name: "Lolade Bayo",
              amount: "#3,000",
              status: "2/3 steps completed",
              buttonText: "Continue Application",
              onTap: () async {
                await LoadingFunction.load(context: context);
                if (context.mounted) {
                  Navigator.pushNamed(context, LoanApplicationScreenOne.id);
                }
              },
            ),
            LoanTile(
              name: "Gbadebisi Jumoke",
              amount: "#3,000",
              status: "2/3 steps completed",
              buttonText: "Continue Application",
              onTap: () async {
                await LoadingFunction.load(context: context);
                if (context.mounted) {
                  Navigator.pushNamed(context, LoanApplicationScreenOne.id);
                }
              },
            ),
            LoanTile(
              name: "Gbadebisi Jumoke",
              amount: "#3,000",
              status: "2/3 steps completed",
              buttonText: "Continue Application",
              onTap: () async {
                await LoadingFunction.load(context: context);
                if (context.mounted) {
                  Navigator.pushNamed(context, LoanApplicationScreenOne.id);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
