import 'package:flutter/material.dart';
import 'package:small_loans_app/utils/const.dart';
import 'package:small_loans_app/utils/loading_function.dart';
import 'package:small_loans_app/views/loan_application/loan_application_screen_one.dart';

import '../../components/balance_card.dart';
import '../../components/loan_history_card.dart';
import '../../components/loan_tile.dart';
import '../../components/outlined_button.dart';
import '../../utils/config/colour_config.dart';
import '../../utils/config/text_config.dart';
import '../track_application/track_application_screen.dart';
import 'components/fund_wallet_dialog_build.dart';
import 'components/refund_loan_dialog_build.dart';

class MyWalletScreen extends StatefulWidget {
  static String id = "/my-wallet-screen";
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  final List<bool> _selection = [true, false, false];

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Wallet",
          style: TextConfig.textStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: appPadding,
        child: Column(
          children: [
            Column(
              children: [
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
                    Expanded(
                      child: StreamBuilder(
                          stream: db
                              .collection("users")
                              .doc(authRef.currentUser!.email)
                              .snapshots(),
                          builder: (context, snapshot) {
                            String? firstName = snapshot.data?["first_name"];
                            return ButtonOutlined(
                              onTap: () => showDialog(
                                context: context,
                                builder: (context) => buildFundWalletDialog(
                                  firstName,
                                  context,
                                  isSelected: _selection,
                                ),
                              ),
                              child: Text(
                                "Request Fund",
                                style: kButtonTextStyle.copyWith(
                                  color: ColourConfig.defaultAppColour,
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: ButtonOutlined(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => buildRefundLoanDialog(),
                          );
                        },
                        child: Text(
                          "Refund Loan",
                          style: kButtonTextStyle.copyWith(
                            color: ColourConfig.defaultAppColour,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                verticalGap,
              ],
            ),
            const Divider(
              thickness: 0.4,
              color: Color(0XFF001529),
            ),
            verticalGap,
            Column(
              children: [
                LoansHistoryCard(
                  title: "All Transactions",
                  style: TextConfig.textStyle
                      .copyWith(color: const Color(0XFF4F4F4F)),
                  nextArrow: const Text(""),
                  items: Column(
                    children: [
                      LoanTile(
                        name: "Wallet Funding",
                        amount: "#30,000",
                        status: "Completed",
                        buttonText: "Disburse New Loan",
                        onTap: () async {
                          await LoadingFunction.load(context: context);
                          if (context.mounted) {
                            Navigator.pushNamed(
                                context, LoanApplicationScreenOne.id);
                          }
                        },
                      ),
                      LoanTile(
                        name: "Loan Disbursement",
                        amount: "#5,000",
                        status: "Unaccepted",
                        buttonText: "Review Application",
                        onTap: () async {
                          await LoadingFunction.load(context: context);
                          if (context.mounted) {
                            Navigator.pushNamed(
                                context, TrackApplicationScreen.id);
                          }
                        },
                      ),
                      LoanTile(
                        name: "Loan Disbursement",
                        amount: "#3,000",
                        status: "Application Saved",
                        buttonText: "Continue Application",
                        onTap: () async {
                          await LoadingFunction.load(context: context);
                          if (context.mounted) {
                            Navigator.pushNamed(
                                context, LoanApplicationScreenOne.id);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
