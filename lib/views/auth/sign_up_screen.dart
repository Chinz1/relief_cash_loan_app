import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:small_loans_app/services/auth.dart';
import 'package:small_loans_app/services/database.dart';
import 'package:small_loans_app/views/auth/components/new_outlined_button.dart';
import '../../components/button.dart';
import '../../components/outlined_button.dart';
import '../../components/text_field.dart';
import '../../utils/config/colour_config.dart';
import '../../utils/config/text_config.dart';
import '../../utils/const.dart';
import 'components/custom_divider.dart';

class SignUpScreen extends StatefulWidget {
  static String id = "/sign-up-screen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _firstNameController;
    _lastNameController;
    _emailController;
    _phoneNumberController;
    _addressController;
    _passwordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextConfig.textStyle.copyWith(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: ColourConfig.defaultAppColour,
                ),
              ),
              SizedBox(height: defaultSize),
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
                  SizedBox(width: paddingSize * 1.7),
                  NewOutlinedButton(
                    icon: FontAwesomeIcons.apple,
                    iconColor: ColourConfig.blackColour,
                    onTap: () {
                      // TODO: Create the necessary function
                    },
                  ),
                ],
              ),
              SizedBox(height: paddingSize * 4),
              const CustomDivider(),
              SizedBox(height: paddingSize * 4),
              CustomTextField(
                label: "First Name",
                hintText: "First Name",
                prefixIcon: const Icon(Icons.person),
                textController: _firstNameController,
              ),
              CustomTextField(
                label: "Last Name",
                hintText: "Last Name",
                prefixIcon: const Icon(Icons.person),
                textController: _lastNameController,
              ),
              CustomTextField(
                label: "Email Address",
                hintText: "Email Address",
                prefixIcon: const Icon(Icons.mail),
                textController: _emailController,
              ),
              CustomTextField(
                label: "Phone Number",
                hintText: "Phone Number",
                prefixIcon: const Icon(Icons.phone),
                textController: _phoneNumberController,
              ),
              CustomTextField(
                label: "Home Address",
                hintText: "Home Address",
                prefixIcon: const Icon(Icons.location_on),
                textController: _addressController,
              ),
              CustomTextField(
                label: "Password",
                hintText: "Password",
                prefixIcon: const Icon(Icons.lock),
                obscureText: _obscureText,
                suffixIcon:
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                textController: _passwordController,
                onPressed: () {
                  setState(() {
                    _obscureText ? _obscureText = false : _obscureText = true;
                  });
                },
              ),
              verticalGap,
              Button(
                onTap: registerUser,
                child: Text(
                  "Sign Up",
                  style: TextConfig.buttonTextStyle.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              verticalGap,
              ButtonOutlined(
                borderColour: ColourConfig.defaultAppColour,
                child: Text(
                  "Log In Instead",
                  style: TextConfig.buttonTextStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColourConfig.defaultAppColour,
                  ),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void registerUser() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    await Auth.registerNewUser(
      firstNameController: _firstNameController,
      lastNameController: _lastNameController,
      emailController: _emailController,
      phoneNumberController: _phoneNumberController,
      addressController: _addressController,
      passwordController: _passwordController,
      context: context,
    );
    // ignore: use_build_context_synchronously
    await Database.createUser(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      email: _emailController.text.trim(),
      phoneNumber: _phoneNumberController.text.trim(),
      address: _addressController.text.trim(),
      context: context,
    );

    if (context.mounted) {
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }
}
