import 'package:flutter/material.dart';
import 'package:small_loans_app/utils/config/colour_config.dart';

import '../../../components/button.dart';
import '../../../utils/config/text_config.dart';
import '../../../utils/const.dart';
import '../../bank_details/bank_details_screen.dart';

class CompleteAccountDetailsTile extends StatelessWidget {
  const CompleteAccountDetailsTile({super.key});

  @override
  Widget build(BuildContext context) {
    var docRef =
        db.collection("users").doc(authRef.currentUser!.email).snapshots();
    return Container(
      padding: EdgeInsets.all(paddingSize * 2),
      decoration: BoxDecoration(
        color: ColourConfig.greyColour,
        borderRadius: appBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder(
            stream: docRef,
            builder: (context, snapshot) {
              String firstName = snapshot.data?['first_name'] ?? "";

              return Text(
                "Hi $firstName",
                style: TextConfig.textStyle.copyWith(fontSize: 18.0),
              );
            },
          ),
          Text(
            "Your account details haven’t been completed yet so you can’t access loans for now. Kindly fill up your details and try again.",
            style: TextConfig.smallText.copyWith(fontSize: 14),
          ),
          verticalGap,
          Button(
            onTap: () => moveToNextScreen(
              context: context,
              routeName: BankDetailsScreen.id,
            ),
            child: Text(
              "Complete Account Details",
              style: TextConfig.buttonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
