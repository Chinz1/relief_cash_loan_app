import 'package:flutter/material.dart';
import '../../../components/alert_dialog.dart';
import '../../../components/small_button.dart';
import '../../../utils/config/colour_config.dart';
import '../../../utils/config/text_config.dart';
import '../../../utils/loading_function.dart';
import '../../successful_fund_request/successful_fund_request_screen.dart';

class RequestFundDialog extends StatelessWidget {
  const RequestFundDialog({
    super.key,
    required this.firstName,
    required List<bool> selection,
  }) : _selection = selection;

  final String? firstName;
  final List<bool> _selection;

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: "Request Fund to Wallet",
      introText:
          "Hello $firstName, for now, you can only access up to #100,000. Subsequently, you get access to more funds with more invitees.",
      content: Column(
        children: [
          Text(
            "Select request amount",
            style: TextConfig.textStyle,
          ),
          const SizedBox(height: 8.0),
          StatefulBuilder(
            builder: (context, setState) {
              return ToggleButtons(
                selectedColor: ColourConfig.defaultAppColour,
                textStyle: TextConfig.textStyle,
                isSelected: _selection,
                borderRadius: BorderRadius.circular(5.0),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("#50,000"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("#75,000"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("#100,000"),
                  ),
                ],
                onPressed: (index) {
                  setState(() {
                    for (var i = 0; i < _selection.length; i++) {
                      if (i == index) {
                        _selection[i] = !_selection[i];
                      } else {
                        _selection[i] = false;
                      }
                    }
                  });
                },
              );
            },
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: ColourConfig.greyColour,
              ),
              const SizedBox(width: 4.0),
              Text(
                "Your current level is Sapphire",
                style: TextConfig.textStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallButton(
                fontSize: 16.0,
                text: "Request Funds",
                onTap: () async {
                  await LoadingFunction.load(context: context);
                  if (context.mounted) {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                        context, SuccessfulFundRequestScreen.id);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
