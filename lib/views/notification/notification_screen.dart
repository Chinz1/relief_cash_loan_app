import 'package:flutter/material.dart';
import 'package:small_loans_app/utils/const.dart';
import 'package:small_loans_app/views/notification/components/notification_tile.dart';
import 'package:small_loans_app/components/small_button.dart';
import 'package:small_loans_app/views/denied_loan/denied_loan_screen.dart';

import '../../utils/config/text_config.dart';

class NotificationScreen extends StatelessWidget {
  static String id = "/notification-screen";
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: TextConfig.textStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: appPadding,
        child: Column(
          children: [
            const NotificationTile(
              title: "Loan Request Approval",
              message:
                  "The loan you requested for on 13/04/2023 has been approved and disbursed accordingly. Kindly report any issues if there’s any error.",
              button: SizedBox.shrink(),
            ),
            const NotificationTile(
              title: "Level Upgrade",
              message:
                  "You have stepped up to a new level and can now access higher amounts of loan up to #200,000. \nHere’s a big Weldone to you!",
              button: SizedBox.shrink(),
            ),
            const NotificationTile(
              title: "New Invite Notice",
              message:
                  "Your recent invitee by the name “Adeola Aragbona” has also invited someone else and thus increased your link. \nWeldone",
              button: SizedBox.shrink(),
            ),
            NotificationTile(
              title: "Loan Request Failed",
              message:
                  "There was an error with the loan you requested for on 13/04/2023. Kindly check for any mistakes and try again. Thank you.",
              button: Row(
                children: [
                  SmallButton(
                    text: "Review Application",
                    onTap: () =>
                        Navigator.pushNamed(context, DeniedLoanScreen.id),
                  ),
                ],
              ),
            ),
            const NotificationTile(
              title: "Account Details Verified",
              message:
                  "The account details you submitted for a customer has been verified and now ready to process transactions.",
              button: SizedBox.shrink(),
            ),
            const NotificationTile(
              title: "Loan Request Approved",
              message:
                  "The loan you requested for on 13/08/2023 has been approvedand disbursed accordingly.\n Kindly report any issues if there's any error.",
              button: SizedBox.shrink(),
            ),
            const NotificationTile(
              title: "Loan Request Approved",
              message:
                  "The loan you requested for on 13/08/2023 has been approvedand disbursed accordingly.\n Kindly report any issues if there's any error.",
              button: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
