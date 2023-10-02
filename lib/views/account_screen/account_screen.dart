import 'package:flutter/material.dart';
import 'package:small_loans_app/views/account_screen/components/account_action_tile.dart';
import 'package:small_loans_app/utils/const.dart';
import '../../components/profile_circle.dart';
import '../../utils/config/text_config.dart';
import '../bank_details/bank_details_screen.dart';
import '../basic_details/basic_details_screen.dart';
import '../my_wallet/my_wallet_screen.dart';

class AccountScreen extends StatelessWidget {
  static String id = "/account-screen";
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = defaultSize * 3.5;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account",
          style: TextConfig.textStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: appPadding,
        child: Column(
          children: [
            Column(
              children: [
                ProfileCircle(size: size),
                AccountActionTile(
                  title: "Basic Details",
                  subtitle: "Name, phone number, address etc.",
                  onTap: () =>
                      Navigator.pushNamed(context, BasicDetailsScreen.id),
                  icon: Icons.person_rounded,
                ),
                AccountActionTile(
                  title: "Bank Details",
                  subtitle: "Account details, ATM cards",
                  icon: Icons.description_rounded,
                  onTap: () =>
                      Navigator.pushNamed(context, BankDetailsScreen.id),
                ),
                AccountActionTile(
                  title: "My Wallet",
                  subtitle: "request for funds, refund wallet",
                  icon: Icons.wallet_rounded,
                  onTap: () => Navigator.pushNamed(context, MyWalletScreen.id),
                ),
              ],
            ),
            SizedBox(height: paddingSize * 15),
            TextButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                await authRef.signOut();
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              child: const Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}

