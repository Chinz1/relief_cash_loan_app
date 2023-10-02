import 'package:flutter/material.dart';
import 'package:small_loans_app/components/outlined_icon_button.dart';
import 'package:small_loans_app/utils/config/text_config.dart';
import 'package:small_loans_app/utils/const.dart';
import 'package:small_loans_app/views/loan_application/loan_application_screen_one.dart';
import '../../components/button.dart';
import '../loan_guide/loan_guide_screen.dart';
import '../pending_application/pending_application_screen.dart';
import '../report_issue/report_issues.dart';
import '../saved_application/saved_application_screen.dart';
import 'components/action_tile.dart';
import 'components/complete_account_details_tile.dart';
import 'components/new_loan_history_tile.dart';

class LoanScreen extends StatelessWidget {
  static String id = "/loan-screen";
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: appPadding.add(
            EdgeInsets.only(
              top: paddingSize * 2,
            ),
          ),
          child: Column(
            children: [
              const CompleteAccountDetailsTile(),
              verticalGap,
              Button(
                onTap: () => moveToNextScreen(
                  context: context,
                  routeName: LoanApplicationScreenOne.id,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Disburse New Loan",
                      style: TextConfig.buttonTextStyle,
                    ),
                    SizedBox(
                      width: paddingSize,
                    ),
                    const Icon(
                      Icons.add,
                    )
                  ],
                ),
              ),
              verticalGap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedIconButton(
                    icon: Icons.favorite,
                    text: 'Saved Application',
                    onTap: () => moveToNextScreen(
                      context: context,
                      routeName: SavedApplicationScreen.id,
                    ),
                  ),
                  horizontalGap,
                  OutlinedIconButton(
                    icon: Icons.hourglass_bottom,
                    text: 'Pending Loans',
                    onTap: () => moveToNextScreen(
                      context: context,
                      routeName: PendingApplicationScreen.id,
                    ),
                  ),
                ],
              ),
              verticalGap,
              verticalGap,
              ActionTiles(
                title: "Loan guide, info and advice",
                subtitle: "Necessary information before disbursing loans",
                icon: Icons.check_circle,
                onTap: () => moveToNextScreen(
                  context: context,
                  routeName: LoanGuideScreen.id,
                ),
              ),
              SizedBox(
                height: defaultSize / 2,
              ),
              ActionTiles(
                title: "Report issues",
                subtitle: "Unresponsive beneficiary, account issues etc.",
                icon: null,
                onTap: () => moveToNextScreen(
                  context: context,
                  routeName: ReportIssuesScreen.id,
                ),
              ),
              verticalGap,
              const NewLoanHistoryTile(),
              verticalGap,
            ],
          ),
        ),
      ),
    );
  }
}
