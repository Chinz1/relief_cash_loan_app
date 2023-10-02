import 'package:flutter/material.dart';

import '../../../utils/config/colour_config.dart';
import '../../../utils/config/text_config.dart';
import '../../../utils/const.dart';

class ActionTiles extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  final void Function() onTap;
  const ActionTiles({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: const Color(0XFFF5FAFF),
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: const Color(0XFFF2F2F2), width: 0.8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Icon(
                        icon,
                        color: const Color(0XFFE0E0E0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    subtitle,
                    style: TextConfig.textStyle.copyWith(
                        fontWeight: FontWeight.w500, fontSize: 12.0),
                  )
                ],
              ),
              Icon(
                Icons.navigate_next,
                color:  ColourConfig.defaultAppColour,
                size: kDefaultIconSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
