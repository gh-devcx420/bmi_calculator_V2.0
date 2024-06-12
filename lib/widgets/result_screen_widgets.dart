import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/enums.dart';
import 'package:bmi_calculator/screens/bmi_home.dart';
import 'package:bmi_calculator/widgets/basic_widgets.dart';
import 'package:bmi_calculator/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatefulWidget {
  const ResultCard({
    super.key,
  });

  @override
  State<ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  void showResultRangeHelpDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: kAlertDialogueCardVerticalPadding,
              horizontal: kAlertDialogueCardHorizontalPadding,
            ),
            decoration: BoxDecoration(
              color: kPrimaryWhite,
              borderRadius: kAlertDialogueRoundness,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Clinical BMI Range',
                  style: kAlertDialogueHeadingTextStyle,
                ),
                kVerticalGap10,
                kVerticalGap10,
                BMIClinicalRangeIndicator(
                  resultRangeText: 'Underweight : 0 - $kBMIUnderWeightLimit',
                  resultRangeTextStyle:
                      currentInputValueObject.bmiResultInference ==
                              ResultInference.underweight
                          ? kBMIResultRangeTextStyledEnabled
                          : kBMIResultRangeTextStyledDisabled,
                  resultRangeColour: kBMIUnderweightColour,
                ),
                BMIClinicalRangeIndicator(
                  resultRangeText:
                      'Normal : ${kBMIUnderWeightLimit + 0.1} - $kBMINormalLimit',
                  resultRangeTextStyle:
                      currentInputValueObject.bmiResultInference ==
                              ResultInference.normal
                          ? kBMIResultRangeTextStyledEnabled
                          : kBMIResultRangeTextStyledDisabled,
                  resultRangeColour: kBMINormalColour,
                ),
                BMIClinicalRangeIndicator(
                  resultRangeText:
                      'Slightly Overweight : ${kBMINormalLimit + 0.1} - $kBMISlightlyOverWeightLimit',
                  resultRangeTextStyle:
                      currentInputValueObject.bmiResultInference ==
                              ResultInference.slightlyOverweight
                          ? kBMIResultRangeTextStyledEnabled
                          : kBMIResultRangeTextStyledDisabled,
                  resultRangeColour: kBMISlightlyOverWeightColour,
                ),
                BMIClinicalRangeIndicator(
                  resultRangeText:
                      'Overweight : ${kBMISlightlyOverWeightLimit + 0.1} & Above',
                  resultRangeTextStyle:
                      currentInputValueObject.bmiResultInference ==
                              ResultInference.overweight
                          ? kBMIResultRangeTextStyledEnabled
                          : kBMIResultRangeTextStyledDisabled,
                  resultRangeColour: kBMIOverWeightColour,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: kCardVerticalPadding,
            horizontal: kCardHorizontalPadding,
          ),
          decoration: BoxDecoration(
            color: kPrimaryWhite,
            borderRadius: kCardRoundness,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  kHorizontalGap8,
                  Text(
                    'BMI Inference Sheet',
                    style: kCardHeadingTextStyle,
                  ),
                ],
              ),
              kVerticalGap8,
              const BMISelectedInputValueDisplayRow(),
              kVerticalGap8,
              const BMIDivider(),
              kVerticalGap8,
              BMICardSectionHeaderWithIndicatorText(
                resultHelpDialogue: showResultRangeHelpDialogue,
              ),
              kVerticalGap8,
              Row(
                children: [
                  const BMIResultLabel(),
                  kHorizontalGap8,
                  const Expanded(
                    child: BMIResultGauge(),
                  ),
                ],
              ),
              kVerticalGap8,
              const BMIDivider(),
              kVerticalGap8,
              const BMIResultInformation(),
            ],
          ),
        ),
      ),
    );
  }
}
