import 'package:flutter/material.dart';

import '../../../utils/config/colour_config.dart';
import '../../../utils/const.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    required this.isPageOne,
    required this.isPageTwo,
    required this.isPageThree,
  });
  final bool isPageOne;
  final bool isPageTwo;
  final bool isPageThree;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: isPageOne,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 6.0,
                width: 24.0,
                decoration: BoxDecoration(
                  color: ColourConfig.defaultAppColour,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              SizedBox(width: paddingSize),
              Container(
                height: 6.0,
                width: 6.0,
                decoration: BoxDecoration(
                  color: ColourConfig.midGreyColour,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              SizedBox(width: paddingSize),
              Container(
                height: 6.0,
                width: 6.0,
                decoration: BoxDecoration(
                  color: ColourConfig.midGreyColour,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: isPageTwo,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 6.0,
                width: 6.0,
                decoration: BoxDecoration(
                  color: ColourConfig.midGreyColour,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              SizedBox(width: paddingSize),
              Container(
                height: 6.0,
                width: 24.0,
                decoration: BoxDecoration(
                  color: ColourConfig.defaultAppColour,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              SizedBox(width: paddingSize),
              Container(
                height: 6.0,
                width: 6.0,
                decoration: BoxDecoration(
                  color: ColourConfig.midGreyColour,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: isPageThree,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 6.0,
                width: 6.0,
                decoration: BoxDecoration(
                  color: ColourConfig.midGreyColour,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              SizedBox(width: paddingSize),
              Container(
                height: 6.0,
                width: 6.0,
                decoration: BoxDecoration(
                  color: ColourConfig.midGreyColour,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              SizedBox(width: paddingSize),
              Container(
                height: 6.0,
                width: 24.0,
                decoration: BoxDecoration(
                  color: ColourConfig.defaultAppColour,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
