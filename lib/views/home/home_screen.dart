import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:small_loans_app/components/button.dart';
import 'package:small_loans_app/components/loan_tile.dart';
import 'package:small_loans_app/utils/loading_function.dart';
import 'package:small_loans_app/components/outlined_icon_button.dart';
import 'package:small_loans_app/views/loan_application/loan_application_screen_one.dart';
import '../../components/balance_card.dart';
import '../../utils/config/colour_config.dart';
import '../../utils/config/text_config.dart';
import '../../utils/const.dart';
import '../notification/notification_screen.dart';
import '../pending_application/pending_application_screen.dart';
import '../saved_application/saved_application_screen.dart';
import '../track_application/track_application_screen.dart';
import 'components/new_button_outlined.dart';
import 'components/new_loan_history_card.dart';
import 'components/refund_loan_dialog.dart';
import 'components/request_fund_dialog.dart';

class HomeScreen extends StatefulWidget {
  static String id = "/home";
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<bool> _selection = [true, false, false];
  bool isVisible = false;

  Stream<DocumentSnapshot<Map<String, dynamic>>> docRef =
      db.collection("users").doc(authRef.currentUser!.email).snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StreamBuilder(
                        stream: docRef,
                        builder: (context, snapshot) {
                          String? firstName =
                              snapshot.data?['first_name'] ?? "";

                          return Text(
                            "Welcome $firstName",
                            style:
                                TextConfig.textStyle.copyWith(fontSize: 18.0),
                          );
                        },
                      ),
                      IconButton(
                        onPressed: () async {
                          if (context.mounted) {
                            Navigator.pushNamed(context, NotificationScreen.id);
                          }
                          await LoadingFunction.load(context: context);
                        },
                        icon: const Icon(Icons.circle_notifications_outlined),
                        color: ColourConfig.defaultAppColour,
                        iconSize: 32.0,
                      )
                    ],
                  ),
                  verticalGap,
                  BalanceCard(
                    onPressed: () {
                      setState(() {
                        if (isVisible) {
                          isVisible = false;
                        } else {
                          isVisible = true;
                        }
                      });
                    },
                    isAmountVisible: isVisible,
                  ),
                  verticalGap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StreamBuilder(
                          stream: docRef,
                          builder: (context, snapshot) {
                            String? firstName = snapshot.data?["first_name"];
                            return NewOutlinedButton(
                              selection: _selection,
                              buttonText: 'Request Fund',
                              onTap: () => showDialog(
                                context: context,
                                builder: (context) => RequestFundDialog(
                                  firstName: firstName,
                                  selection: _selection,
                                ),
                              ),
                            );
                          }),
                      horizontalGap,
                      NewOutlinedButton(
                        selection: _selection,
                        buttonText: 'Refund Loan',
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => const RefundLoanDialog(),
                        ),
                      ),
                    ],
                  ),
                  verticalGap,
                ],
              ),
              Divider(
                thickness: borderWidth,
                color: ColourConfig.dividerColour,
              ),
              verticalGap,
              Column(
                children: [
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
                        text: 'Saved Application',
                        icon: Icons.favorite,
                        onTap: () => moveToNextScreen(
                          context: context,
                          routeName: SavedApplicationScreen.id,
                        ),
                      ),
                      SizedBox(width: paddingSize),
                      OutlinedIconButton(
                        text: 'Pending Loans',
                        icon: Icons.favorite,
                        onTap: () => moveToNextScreen(
                          context: context,
                          routeName: PendingApplicationScreen.id,
                        ),
                      ),
                    ],
                  ),
                  verticalGap,
                  NewLoanHistoryCard(
                    items: Column(
                      children: [
                        LoanTile(
                          name: "Loan Disbursment",
                          amount: "#5,000",
                          status: "Unacepted",
                          buttonText: "Review Application",
                          onTap: () => moveToNextScreen(
                            context: context,
                            routeName: TrackApplicationScreen.id,
                          ),
                        )
                      ],
                    ),
                  ),
                  verticalGap,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
