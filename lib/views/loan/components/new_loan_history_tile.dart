import 'package:flutter/material.dart';
import '../../../components/loan_history_card.dart';
import '../../../components/loan_tile.dart';
import '../../../utils/const.dart';
import '../../denied_loan/denied_loan_screen.dart';
import '../../loan_application/loan_application_screen_one.dart';
import '../../track_application/track_application_screen.dart';

class NewLoanHistoryTile extends StatelessWidget {
  const NewLoanHistoryTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoansHistoryCard(
      nextArrow: const Text(""),
      title: "Loans History",
      items: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingSize),
        child: Column(
          children: [
            LoanTile(
              name: "Olabisi Bolanle",
              amount: "#5,000",
              status: "Completed",
              buttonText: "Track Application",
              onTap: () => moveToNextScreen(
                context: context,
                routeName: TrackApplicationScreen.id,
              ),
            ),
            LoanTile(
              name: "Gbadebisi Jumoke",
              amount: "#3,000",
              status: "Application Saved",
              buttonText: "Continue Application",
              onTap: () => moveToNextScreen(
                context: context,
                routeName: LoanApplicationScreenOne.id,
              ),
            ),
            LoanTile(
              name: "Olabisi Bolanle",
              amount: "#5,000",
              status: "Unaccepted",
              buttonText: "Review Application",
              onTap: () => moveToNextScreen(
                context: context,
                routeName: DeniedLoanScreen.id,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
