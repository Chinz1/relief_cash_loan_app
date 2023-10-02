import 'package:flutter/material.dart';
import '../utils/config/colour_config.dart';
import '../utils/config/text_config.dart';
import '../utils/const.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String introText;
  final Widget? content;
  const CustomAlertDialog(
      {super.key,
      required this.title,
      required this.introText,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Dialog(
          insetPadding: const EdgeInsets.all(20.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: ColourConfig.whiteColour,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextConfig.textStyle.copyWith(
                        fontSize: 20.0,
                        color: ColourConfig.defaultAppColour,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: ColourConfig.blackColour,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                Text(
                  introText,
                ),
                SizedBox(height: paddingSize),
                content!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
