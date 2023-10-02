import 'package:flutter/material.dart';

import '../utils/config/colour_config.dart';
import '../utils/config/text_config.dart';

class LoansHistoryCard extends StatelessWidget {
  final Widget items;
  final Widget? nextArrow;
  final String title;
  final TextStyle? style;
  const LoansHistoryCard({
    super.key,
    required this.items,
    required this.title,
    this.style,
    this.nextArrow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0XFFE0E0E0),
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(5.0),
          topLeft: Radius.circular(5.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(bottom: 12.0),
            padding:
                const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Color(0XFFF5FAFF),
              border: Border(
                bottom: BorderSide(
                  color: Color(0XFFE0E0E0),
                ),
              ),
              // borderRadius: BorderRadius.only(
              //   topRight: Radius.circular(5.0),
              //   topLeft: Radius.circular(5.0),
              // ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.history,
                      color: ColourConfig.defaultAppColour,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      title,
                      style: style ??
                          TextConfig.textStyle.copyWith(
                            color: const Color(0XFF005099),
                          ),
                    ),
                  ],
                ),
                nextArrow!,
              ],
            ),
          ),
          items,
        ],
      ),
    );
  }
}
