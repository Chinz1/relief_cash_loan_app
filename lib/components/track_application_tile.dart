import 'package:flutter/material.dart';

import '../utils/config/colour_config.dart';
import '../utils/config/text_config.dart';

class TrackApplicationTile extends StatelessWidget {
  final String name;
  final String amount;
  final String status;
  final Color? statusColour;
  final String? date;
  final String descriptionText;

  const TrackApplicationTile({
    super.key,
    required this.name,
    required this.amount,
    required this.status,
    this.statusColour,
    this.date, required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0XFFF2F2F2),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: Color(0XFF000000),
                  ),
                  Text(
                    name,
                    style: TextConfig.textStyle,
                  ),
                ],
              ),
              Text(
                amount,
                style: TextConfig.textStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: ColourConfig.defaultAppColour,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: "Status: ",
                  style: TextConfig.textStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: ColourConfig.blackColour,
                    fontFamily: 'Yaldevi',
                  ),
                  children: [
                    TextSpan(
                      text: status,
                      style: TextConfig.textStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                        color: statusColour ?? ColourConfig.blackColour,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                date ?? "14/08/2022",
                style: TextConfig.textStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Text(
            descriptionText,
          ),
        ],
      ),
    );
  }
}
