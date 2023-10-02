import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:small_loans_app/components/outlined_button.dart';
import 'package:small_loans_app/components/profile_circle.dart';
import 'package:small_loans_app/utils/const.dart';

import '../../components/text_field.dart';
import '../../utils/config/colour_config.dart';
import '../../utils/config/text_config.dart';

class BasicDetailsScreen extends StatelessWidget {
  static String id = "/basic-details-screen";
  BasicDetailsScreen({super.key});

  Stream<DocumentSnapshot<Map<String, dynamic>>> docRef =
      db.collection("users").doc(authRef.currentUser!.email).snapshots();

  @override
  Widget build(BuildContext context) {
    var size = defaultSize * 3.5;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Basic Details",
          style: TextConfig.textStyle,
        ),
      ),
      body: StreamBuilder(
          stream: docRef,
          builder: (context, snapshot) {
            String? firstName = snapshot.data?['first_name'] ?? "";
            String? lastName = snapshot.data?['last_name'] ?? "";
            String? emailAddress = snapshot.data?['email_address'] ?? "";
            String? phoneNumber = snapshot.data?['phone_number'] ?? "";
            String? homeAddress = snapshot.data?['home_address'] ?? "";

            if (snapshot.hasData) {
              return SingleChildScrollView(
                padding: appPadding,
                child: Column(
                  children: [
                    ProfileCircle(size: size),
                    CustomTextField(
                      label: "First Name",
                      hintText: "First Name",
                      initialValue: firstName,
                      prefixIcon: const Icon(Icons.person),
                      readOnly: true,
                    ),
                    CustomTextField(
                      label: "Last Name",
                      hintText: "Last Name",
                      initialValue: lastName,
                      prefixIcon: const Icon(Icons.person),
                      readOnly: true,
                    ),
                    CustomTextField(
                      label: "Email Address",
                      hintText: "Email Address",
                      initialValue: emailAddress,
                      prefixIcon: const Icon(Icons.mail),
                      readOnly: true,
                    ),
                    CustomTextField(
                      label: "Phone Number",
                      hintText: "Phone Number",
                      initialValue: phoneNumber,
                      prefixIcon: const Icon(Icons.phone),
                      readOnly: true,
                    ),
                    CustomTextField(
                      label: "Home Address",
                      hintText: "Home Address",
                      initialValue: homeAddress,
                      prefixIcon: const Icon(Icons.location_on),
                      readOnly: true,
                    ),
                    const CustomTextField(
                      label: "Password",
                      hintText: "Password",
                      initialValue: "******",
                      prefixIcon: Icon(Icons.lock),
                      readOnly: true,
                    ),
                    verticalGap,
                    ButtonOutlined(
                      child: Text(
                        "Edit Details",
                        style: TextConfig.buttonTextStyle.copyWith(
                          color: ColourConfig.defaultAppColour,
                        ),
                      ),
                      onTap: () {
                        // TODO: Create the necessary function
                      },
                    ),
                    verticalGap,
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
