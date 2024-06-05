import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/enums.dart';
import 'package:bmi_calculator/screens/bmi_home.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

/// BMI Basic Widgets: These Widgets are specific.
// 1) BUTTON WIDGET to RESET the selected Input Values.
class BMIResetButton extends StatelessWidget {
  const BMIResetButton({
    required this.resetSliderValues,
    super.key,
  });

  final Function() resetSliderValues;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: resetSliderValues,
      child: Container(
        height: kResetButtonHeight,
        decoration: BoxDecoration(
          color: kPrimaryWhite,
          borderRadius: kResetButtonRoundness,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.redo,
              color: kPrimaryBlue,
              size: kResetButtonIconSize,
            ),
            kHorizontalGap4,
            Text(
              'Reset',
              style: kResetButtonTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

// 2) BUTTON WIDGET to CALCULATE the RESULTS.
class BMICalculateButton extends StatelessWidget {
  const BMICalculateButton({
    required this.calculateResults,
    super.key,
  });

  final Function() calculateResults;

  void showIncompleteInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.symmetric(
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
                  'Re-Check Your Values',
                  style: kAlertDialogueHeadingTextStyle,
                ),
                kVerticalGap10,
                if (currentInputValueObject.selectedGender == Gender.none)
                  Text(
                    'Please Select Gender',
                    style: kAlertDialogueErrorTextStyle,
                  )
                else if (currentInputValueObject.ageSliderValue == 0)
                  Text(
                    'Please Select Age',
                    style: kAlertDialogueErrorTextStyle,
                  )
                else if (((currentInputValueObject.feetSliderValue == 0 &&
                        currentInputValueObject.inchSliderValue == 0) &&
                    currentInputValueObject.cmsSliderValue == 0))
                  Text(
                    'Please Select Height',
                    style: kAlertDialogueErrorTextStyle,
                  )
                else if ((currentInputValueObject.kgsSliderValue == 0 ||
                    currentInputValueObject.lbsSliderValue == 0))
                  Text(
                    'Please Select Weight',
                    style: kAlertDialogueErrorTextStyle,
                  ),
                kVerticalGap10,
                kVerticalGap10,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BMIButton(
                      buttonVerticalPadding:
                          kAlertDialogueOkButtonVerticalPadding,
                      buttonHorizontalPadding:
                          kAlertDialogueOkButtonHorizontalPadding,
                      buttonColour: kPrimaryBlue,
                      onButtonTap: () {
                        Navigator.of(context).pop();
                      },
                      buttonLabelText: 'Ok',
                      buttonLabelTextColour: kPrimaryWhite,
                      buttonLabelTextFontSize: 16,
                      buttonRoundness: 22,
                    ),
                  ],
                ),
                kVerticalGap10,
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (currentInputValueObject.selectedGender != Gender.none &&
            currentInputValueObject.ageSliderValue != 0 &&
            (currentInputValueObject.feetSliderValue != 0 ||
                currentInputValueObject.inchSliderValue != 0 ||
                currentInputValueObject.cmsSliderValue != 0) &&
            (currentInputValueObject.kgsSliderValue != 0 ||
                currentInputValueObject.lbsSliderValue != 0)) {
          calculateResults();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ResultScreen(),
            ),
          );
        } else {
          showIncompleteInputDialog(context);
        }
      },
      child: Container(
        height: kCalculateButtonHeight,
        //width: kCalculateButtonWidth,
        decoration: BoxDecoration(
          color: kPrimaryWhite,
          borderRadius: kCalculateButtonRoundness,
        ),
        child: Center(
          child: Text(
            'Calculate BMI',
            style: kCalculateButtonLabelStyle,
          ),
        ),
      ),
    );
  }
}

// 3) LABEL WIDGET to Display the BMI RESULTS SCORE.
class BMIResultLabel extends StatelessWidget {
  const BMIResultLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: kBMIResultLabelVerticalPadding,
            horizontal: kBMIResultLabelHorizontalPadding,
          ),
          decoration: BoxDecoration(
            color: currentInputValueObject.bmiResultColour,
            borderRadius: kBMIResultLabelRoundness,
          ),
          child: Center(
            child: Text(
              currentInputValueObject.bmiResult.toStringAsFixed(2),
              style: kBMIResultLabelTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}

// 4) GAUGE WIDGET to Display the BMI RESULTS SCORE in a visibly neat Gauge Scale.
class BMIResultGauge extends StatelessWidget {
  const BMIResultGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      showLabels: false,
      showTicks: false,
      showAxisTrack: false,
      minimum: 0,
      maximum: kBMIOverWeightLimit,
      ranges: [
        LinearGaugeRange(
          startValue: 0,
          endValue: kBMIUnderWeightLimit,
          color: kBMIUnderweightColour,
        ),
        LinearGaugeRange(
          startValue: kBMIUnderWeightLimit,
          endValue: kBMINormalLimit,
          color: kBMINormalColour,
        ),
        LinearGaugeRange(
          startValue: kBMINormalLimit,
          endValue: kBMISlightlyOverWeightLimit,
          color: kBMISlightlyOverWeightColour,
        ),
        LinearGaugeRange(
          startValue: kBMISlightlyOverWeightLimit,
          endValue: kBMIOverWeightLimit,
          color: kBMIOverWeightColour,
        ),
      ],
      markerPointers: [
        LinearShapePointer(
          value: currentInputValueObject.bmiResult,
          color: kPrimaryBlue,
          enableAnimation: true,
          animationDuration: 1500,
          animationType: LinearAnimationType.easeInCirc,
          position: LinearElementPosition.outside,
        ),
      ],
    );
  }
}
