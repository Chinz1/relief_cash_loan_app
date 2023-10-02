import 'package:flutter/material.dart';
import '../../../components/loan_history_card.dart';
import '../../../utils/config/colour_config.dart';
import '../../../utils/config/text_config.dart';
import '../../../utils/const.dart';
import '../../all_applications/all_applications_screen.dart';

class NewLoanHistoryCard extends StatelessWidget {
  const NewLoanHistoryCard({
    super.key, required this.items,
  });

  final Widget items;

  @override
  Widget build(BuildContext context) {
    return LoansHistoryCard(
      title: "Recent Transactions",
      style: TextConfig.textStyle.copyWith(
        color: ColourConfig.darkerGreyColour,
      ),
      nextArrow: GestureDetector(
        onTap: () => moveToNextScreen(
          context: context,
          routeName: AllApplicationsScreen.id,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "See All",
              style: TextConfig.textStyle.copyWith(
                color: ColourConfig.defaultAppColour,
                decoration: TextDecoration.underline,
              ),
            ),
            Icon(
              Icons.navigate_next,
              size: kDefaultIconSize,
              color: ColourConfig.defaultAppColour,
            ),
          ],
        ),
      ),
      items: items,
    );
  }
}
