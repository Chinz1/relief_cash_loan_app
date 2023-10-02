import 'package:flutter/material.dart';
import 'package:small_loans_app/utils/const.dart';
import '../../../utils/config/colour_config.dart';
import '../../../utils/config/text_config.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String message;
  final Widget? button;
  const NotificationTile({
    super.key,
    required this.title,
    required this.message,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    double newSize = paddingSize + 2;
    return Container(
      margin: EdgeInsets.only(bottom: newSize),
      padding: EdgeInsets.all(newSize),
      decoration: BoxDecoration(
        color: ColourConfig.greyColour,
        borderRadius: appBorderRadius,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextConfig.textStyle.copyWith(fontSize: 14.0),
              ),
              Text(
                "14/08/2022",
                style: TextConfig.textStyle.copyWith(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            message,
            style: TextConfig.textStyle.copyWith(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          button!,
        ],
      ),
    );
  }
}
