import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../components/outlined_button.dart';
import '../../../utils/config/text_config.dart';
import '../../../utils/const.dart';

class NewOutlinedButton extends StatelessWidget {
  final Color? iconColor;
  final IconData? icon;
  final void Function() onTap;
  const NewOutlinedButton({
    super.key,
    this.iconColor,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ButtonOutlined(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Continue with",
              style: TextConfig.smallText.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: paddingSize),
            FaIcon(
              icon,
              color: iconColor,
              size: defaultSize / 2,
            ),
          ],
        ),
      ),
    );
  }
}
