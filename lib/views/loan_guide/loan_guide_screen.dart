import 'package:flutter/material.dart';
import 'package:small_loans_app/components/acknowledgement_tile.dart';

import '../../utils/config/text_config.dart';
import '../../utils/const.dart';

class LoanGuideScreen extends StatefulWidget {
  static String id = "/Loan-guide-screen";
  const LoanGuideScreen({super.key});

  @override
  State<LoanGuideScreen> createState() => _LoanGuideScreenState();
}

class _LoanGuideScreenState extends State<LoanGuideScreen> {
  bool? isMerchantChecked = false;
  bool? isBeneficiaryChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loan Guide, Info & Advice',
          style: TextConfig.textStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: appPadding.add(
          EdgeInsets.only(
            top: paddingSize * 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Disburse 5k maximum.",
              style: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: paddingSize),
            Text(
              "Ask enough questions before making your decision.",
              style: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: paddingSize),
            Text(
              "Use discretion when asking questions and getting answers.",
              style: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: paddingSize),
            Text(
              "Avoid transactions with bad public record.",
              style: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: paddingSize),
            Text(
              "The plenty plenty explanations and notes for them to read before disbursing loans to people so they don't end up taking responsibility for issues that may arise.The plenty plenty explanations and notes for them to read before disbursing loans to people so they don't end up taking responsibility for issues that may arise.The plenty plenty explanations and notes for them to read before disbursing loans to people so they don't end up taking responsibility for issues that may arise.The plenty plenty explanations and notes for them to read before disbursing loans to people so they don't end up taking responsibility for issues that may arise.The plenty plenty explanations and notes for them to read before disbursing loans to people so they don't end up taking responsibility for issues that may arise.The plenty plenty explanations and notes for them to read before disbursing loans to people so they don't end up taking responsibility for issues that may arise.The plenty plenty explanations and notes for them to read before disbursing loans to people so they don't end up taking responsibility for issues that may arise.",
              style: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: paddingSize),
            Text(
              "Note:",
              style: TextConfig.textStyle,
            ),
            Text(
              "The plenty plenty explanations and notes for them to read before disbursing loans to people so they don't end up taking responsibility for issues that may arise.",
              style: TextConfig.textStyle.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: paddingSize),
            AcknowledgementTile(
              isChecked: isMerchantChecked,
              fontWeight: FontWeight.w500,
              onChanged: (value) {
                setState(() {
                  isMerchantChecked = value;
                });
              },
              person: "the merchant",
            ),
            SizedBox(height: paddingSize),
            AcknowledgementTile(
              isChecked: isBeneficiaryChecked,
              fontWeight: FontWeight.w500,
              onChanged: (value) {
                setState(() {
                  isBeneficiaryChecked = value;
                });
              },
              person: "the beneficiary",
            ),
          ],
        ),
      ),
    );
  }
}
