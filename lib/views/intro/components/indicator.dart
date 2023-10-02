import 'package:flutter/material.dart';

import '../../../utils/config/colour_config.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.isFirstPage,
  });
  final bool isFirstPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: isFirstPage,
          child: Container(
            height: 6.0,
            width: 24.0,
            decoration: BoxDecoration(
              color: ColourConfig.defaultAppColour,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Container(
          height: 6.0,
          width: 6.0,
          decoration: BoxDecoration(
            color: ColourConfig.midGreyColour,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        const SizedBox(width: 8.0),
        Visibility(
          visible: !isFirstPage,
          child: Container(
            height: 6.0,
            width: 24.0,
            decoration: BoxDecoration(
              color: ColourConfig.defaultAppColour,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
