import 'package:flutter/material.dart';
import 'package:small_loans_app/utils/config/text_config.dart';
import '../../../components/outlined_button.dart';
import '../../../utils/config/colour_config.dart';

class NewOutlinedButton extends StatelessWidget {
  const NewOutlinedButton({
    super.key,
    required List<bool> selection,
    required this.buttonText,
    required this.onTap,
  });

  final String buttonText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonOutlined(
        onTap: onTap,
        child: Text(
          buttonText,
          style: TextConfig.buttonTextStyle.copyWith(
            color: ColourConfig.defaultAppColour,
          ),
        ),
      ),
    );
  }
}
