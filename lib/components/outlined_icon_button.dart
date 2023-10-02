import 'package:flutter/material.dart';

import 'outlined_button.dart';
import '../utils/config/colour_config.dart';
import '../utils/config/text_config.dart';
import '../utils/const.dart';

class OutlinedIconButton extends StatelessWidget {
  const OutlinedIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData? icon;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonOutlined(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColourConfig.defaultAppColour,
            ),
            SizedBox(
              width: paddingSize,
            ),
            Text(
              text,
              style: TextConfig.buttonTextStyle.copyWith(
                color: ColourConfig.blackColour,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
