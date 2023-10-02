import 'package:flutter/material.dart';
import 'package:small_loans_app/utils/config/colour_config.dart';

import '../../../utils/config/text_config.dart';
import '../../../utils/const.dart';

class AccountActionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final void Function() onTap;
  const AccountActionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double size = defaultSize;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Material(
        child: InkWell(
          borderRadius: appBorderRadius,
          onTap: onTap,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: ColourConfig.faintBlue.withOpacity(.8),
              borderRadius: appBorderRadius,
              border: Border.all(
                color: ColourConfig.defaultAppColour.withOpacity(.2),
                width: borderWidth,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 12.0),
                        child: Icon(
                          icon,
                          size: size,
                          color: ColourConfig.defaultAppColour,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextConfig.textStyle
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: paddingSize,
                          ),
                          Text(
                            subtitle,
                            style: TextConfig.smallText,
                          )
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.navigate_next_rounded,
                    color: ColourConfig.defaultAppColour,
                    size: kDefaultIconSize,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
