import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:small_loans_app/services/auth_state.dart';
import 'package:small_loans_app/utils/config/colour_config.dart';
import 'package:small_loans_app/utils/config/size_config.dart';
import 'package:small_loans_app/views/all_applications/all_applications_screen.dart';
import 'package:small_loans_app/views/loan_application/loan_application_screen_one.dart';
import 'package:small_loans_app/views/loan_application/loan_application_screen_three.dart';
import 'package:small_loans_app/views/loan_application/loan_application_screen_two.dart';
import 'package:small_loans_app/views/b_nav_bar.dart';
import 'package:small_loans_app/views/intro/on_boarding_screen.dart';
import 'package:small_loans_app/views/intro/splash_screen.dart';
import 'package:small_loans_app/views/successful_fund_request/successful_fund_request_screen.dart';
import 'package:small_loans_app/views/successful_loan_application/successful_loan_application_screen.dart';
import 'package:small_loans_app/views/track_application/track_application_screen.dart';
import 'firebase_options.dart';
import 'views/account_screen/account_screen.dart';
import 'views/auth/log_in_screen.dart';
import 'views/auth/sign_up_screen.dart';
import 'views/bank_details/bank_details_screen.dart';
import 'views/basic_details/basic_details_screen.dart';
import 'views/denied_loan/denied_loan_screen.dart';
import 'views/details_saved/details_saved_screen.dart';
import 'views/home/home_screen.dart';
import 'views/loan/loan_screen.dart';
import 'views/loan_guide/loan_guide_screen.dart';
import 'views/my_wallet/my_wallet_screen.dart';
import 'views/notification/notification_screen.dart';
import 'views/pending_application/pending_application_screen.dart';
import 'views/report_issue/report_issues.dart';
import 'views/saved_application/saved_application_screen.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  Timer(const Duration(seconds: 2), () => FlutterNativeSplash.remove());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      theme: buildTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: MyWalletScreen.id,
      routes: routes(),
    );
  }

  ThemeData buildTheme() {
    return ThemeData(
      iconTheme: const IconThemeData(color: Colors.white),
      fontFamily: "Yaldevi",
      colorScheme:
          ColorScheme.fromSeed(seedColor: ColourConfig.defaultAppColour),
      useMaterial3: true,
    );
  }

  Map<String, Widget Function(BuildContext)> routes() {
    return {
      SplashScreen.id: (context) => const SplashScreen(),
      AuthState.id: (context) => const AuthState(),
      OnBoardingScreen.id: (context) => const OnBoardingScreen(),
      BNavBar.id: (context) => const BNavBar(),
      HomeScreen.id: (context) => const HomeScreen(),
      LoanScreen.id: (context) => const LoanScreen(),
      AccountScreen.id: (context) => const AccountScreen(),
      NotificationScreen.id: (context) => const NotificationScreen(),
      SuccessfulFundRequestScreen.id: (context) =>
          const SuccessfulFundRequestScreen(),
      SavedApplicationScreen.id: (context) => const SavedApplicationScreen(),
      PendingApplicationScreen.id: (context) =>
          const PendingApplicationScreen(),
      AllApplicationsScreen.id: (context) => const AllApplicationsScreen(),
      TrackApplicationScreen.id: (context) => const TrackApplicationScreen(),
      DeniedLoanScreen.id: (context) => const DeniedLoanScreen(),
      LoanApplicationScreenOne.id: (context) =>
          const LoanApplicationScreenOne(),
      LoanApplicationScreenTwo.id: (context) =>
          const LoanApplicationScreenTwo(),
      LoanApplicationScreenThree.id: (context) =>
          const LoanApplicationScreenThree(),
      DetailsSavedScreen.id: (context) => const DetailsSavedScreen(),
      SuccessfulLoanApplicationScreen.id: (context) =>
          const SuccessfulLoanApplicationScreen(),
      LoanGuideScreen.id: (context) => const LoanGuideScreen(),
      ReportIssuesScreen.id: (context) => const ReportIssuesScreen(),
      LoginScreen.id: (context) => const LoginScreen(),
      SignUpScreen.id: (context) => const SignUpScreen(),
      BasicDetailsScreen.id: (context) => BasicDetailsScreen(),
      BankDetailsScreen.id: (context) => const BankDetailsScreen(),
      MyWalletScreen.id: (context) => const MyWalletScreen(),
    };
  }
}
