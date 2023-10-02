import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'config/size_config.dart';
import 'loading_function.dart';

final authRef = FirebaseAuth.instance;
final db = FirebaseFirestore.instance;

const phoneIllustrationImage = "assets/images/phone_illustration.png";
const ladyIllustrationImage = "assets/images/lady_illustration.png";

double defaultSize = SizeConfig.defaultSize!;

const kButtonTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 14.0,
  color: Colors.white,
);

const kDefaultIconSize = 28.0;

double paddingSize = defaultSize / 4;

BorderRadius appBorderRadius = BorderRadius.circular(defaultSize / 8);

double borderWidth = defaultSize / 30;

SizedBox verticalGap = SizedBox(height: defaultSize / 1.5);

SizedBox horizontalGap = SizedBox(width: defaultSize / 1.7);

EdgeInsetsGeometry appPadding =
    EdgeInsets.symmetric(horizontal: paddingSize * 2);

/// NAVIGATION

void moveToNextScreen({
  required BuildContext context,
  required String routeName,
}) async {
  await LoadingFunction.load(context: context);
  if (context.mounted) {
    Navigator.pushNamed(context, routeName);
  }
}
