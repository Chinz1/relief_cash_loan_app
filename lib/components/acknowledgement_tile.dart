import 'package:flutter/material.dart';
import '../utils/config/colour_config.dart';
import '../utils/config/text_config.dart';

class AcknowledgementTile extends StatelessWidget {
  final bool? isChecked;
  final void Function(bool?)? onChanged;
  final String person;
  final FontWeight? fontWeight;
  const AcknowledgementTile({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.person,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "I ($person) agree to the ",
              style: TextConfig.textStyle.copyWith(
                color: ColourConfig.blackColour,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: "Terms & Conditions",
                  style: TextConfig.textStyle.copyWith(
                    color: ColourConfig.blackColour,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(
                  text: " for this loan as stated by Relief Cash Inc.",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
