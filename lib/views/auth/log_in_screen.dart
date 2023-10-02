import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:small_loans_app/components/button.dart';
import 'package:small_loans_app/components/outlined_button.dart';
import 'package:small_loans_app/components/text_field.dart';
import 'package:small_loans_app/utils/config/colour_config.dart';
import 'package:small_loans_app/utils/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/config/text_config.dart';
import 'components/custom_divider.dart';
import 'components/new_outlined_button.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = "/login-screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController;
    _passwordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Log In",
                  style: TextConfig.textStyle.copyWith(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: ColourConfig.defaultAppColour,
                  ),
                ),
                const SizedBox(height: 35.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NewOutlinedButton(
                      icon: FontAwesomeIcons.google,
                      iconColor: ColourConfig.redColour,
                      onTap: () {
                        // TODO: Create the necessary function
                      },
                    ),
                    horizontalGap,
                    NewOutlinedButton(
                      icon: FontAwesomeIcons.apple,
                      iconColor: ColourConfig.blackColour,
                      onTap: () {
                        // TODO: Create the necessary function
                      },
                    ),
                  ],
                ),
                SizedBox(height: defaultSize),
                const CustomDivider(),
                SizedBox(height: paddingSize * 4),
                CustomTextField(
                  label: "Email Address",
                  hintText: "Email Address",
                  prefixIcon: const Icon(Icons.mail),
                  textController: _emailController,
                ),
                CustomTextField(
                  label: "Password",
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: _obscureText,
                  textController: _passwordController,
                  suffixIcon:
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                  onPressed: () {
                    setState(() {
                      _obscureText ? _obscureText = false : _obscureText = true;
                    });
                  },
                ),
                verticalGap,
                Button(
                  child: Text(
                    "Log In",
                    style: TextConfig.buttonTextStyle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  onTap: () => logUserIn(),
                ),
                verticalGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: ButtonOutlined(
                        borderColour: ColourConfig.defaultAppColour,
                        child: Text(
                          "Sign Up Instead",
                          style: TextConfig.buttonTextStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: ColourConfig.defaultAppColour,
                          ),
                        ),
                        onTap: () =>
                            Navigator.pushNamed(context, SignUpScreen.id),
                      ),
                    ),
                    Expanded(child: Container()),
                    TextButton(
                      onPressed: () {
                        // TODO: Create the necessary function
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextConfig.buttonTextStyle.copyWith(
                          color: ColourConfig.defaultAppColour,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void logUserIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No user found for that email."),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Wrong password provided for that user."),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$e"),
          ),
        );
      }
    }
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}
