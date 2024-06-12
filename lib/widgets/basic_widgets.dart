import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/enums.dart';
import 'package:bmi_calculator/screens/bmi_home.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  'Re-Check Your Inputs',
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
                      buttonLabelText: 'OK',
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
            style: kCalculateButtonTextStyle,
          ),
        ),
      ),
    );
  }
}

// 3) ROW WIDGET to display the Selected input values in the BMI Inference Sheet.
class BMISelectedInputValueDisplayRow extends StatelessWidget {
  const BMISelectedInputValueDisplayRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          BMITextDisplayChip(
            chipText: currentInputValueObject.selectedGender == Gender.male
                ? 'Male'
                : currentInputValueObject.selectedGender == Gender.female
                    ? 'Female'
                    : 'None',
            chipBackgroundColour: kPrimaryBlue,
          ),
          BMIValueDisplayChip(
            chipValue: currentInputValueObject.ageSliderValue,
            chipText: 'Years',
            chipColour: kPrimaryBlue,
          ),
          if (currentHeightMetric == HeightMetric.feetinches)
            BMIValueDisplayChip(
              chipValue: currentInputValueObject.feetSliderValue,
              chipText: 'Feet',
              chipColour: kPrimaryBlue,
            ),
          if (currentHeightMetric == HeightMetric.feetinches)
            BMIValueDisplayChip(
              chipValue: currentInputValueObject.inchSliderValue,
              chipText: 'Inches',
              chipColour: kPrimaryBlue,
            ),
          if (currentHeightMetric == HeightMetric.cms)
            BMIValueDisplayChip(
              chipValue: currentInputValueObject.cmsSliderValue,
              chipText: 'Cms',
              chipColour: kPrimaryBlue,
            ),
          if (currentWeightMetric == WeightMetric.kgs)
            BMIValueDisplayChip(
              chipValue: currentInputValueObject.kgsSliderValue,
              chipText: 'Kgs',
              chipColour: kPrimaryBlue,
            ),
          if (currentWeightMetric == WeightMetric.pounds)
            BMIValueDisplayChip(
              chipValue: currentInputValueObject.lbsSliderValue,
              chipText: 'Lbs',
              chipColour: kPrimaryBlue,
            ),
        ],
      ),
    );
  }
}

// 4) ROW WIDGET to display the Card Section Name, BMI Result Inference & Actions Icon.
class BMICardSectionHeaderWithIndicatorText extends StatelessWidget {
  const BMICardSectionHeaderWithIndicatorText({
    required this.resultHelpDialogue,
    super.key,
  });

  final Function(BuildContext) resultHelpDialogue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kHorizontalGap8,
        Text(
          'Your BMI is :',
          style: kCardHeadingTextStyle,
        ),
        kHorizontalGap8,
        Text(
          currentInputValueObject.bmiResultInferenceText,
          style: GoogleFonts.robotoCondensed(
            color: currentInputValueObject.bmiResultColour,
            fontSize: kCardTitleFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            resultHelpDialogue(context);
          },
          child: Icon(
            Icons.help,
            color: kPrimaryBlue,
          ),
        ),
        kHorizontalGap8
      ],
    );
  }
}

// 5) LABEL WIDGET to Display the BMI RESULTS SCORE.
class BMIResultLabel extends StatelessWidget {
  const BMIResultLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
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

// 6) GAUGE WIDGET to Display the BMI RESULTS SCORE in a visibly neat Gauge Scale.
class BMIResultGauge extends StatelessWidget {
  const BMIResultGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      showLabels: false,
      showTicks: false,
      showAxisTrack: false,
      minimum: 10,
      maximum: kBMIOverWeightLimit,
      ranges: [
        LinearGaugeRange(
          startValue: 10,
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

// 7) Result Information Widget to display the Information & Tips Text based on the BMI Result.
class BMIResultInformation extends StatelessWidget {
  const BMIResultInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Information Section.
        Row(
          children: [
            kHorizontalGap4,
            Icon(
              FontAwesomeIcons.commentMedical,
              size: 18,
              color: kPrimaryBlue,
            ),
            kHorizontalGap8,
            Text(
              'Information :',
              style: kCardHeadingTextStyle,
            ),
          ],
        ),
        kVerticalGap8,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            kHorizontalGap8,
            if (currentInputValueObject.bmiResultInference ==
                ResultInference.underweight)
              Expanded(
                child: Text(
                  kBMIUnderweightInformationText,
                  style: kBMIInferenceSheetBodyTextStyle,
                ),
              ),
            if (currentInputValueObject.bmiResultInference ==
                ResultInference.normal)
              Expanded(
                child: Text(
                  kBMINormalInformationText,
                  style: kBMIInferenceSheetBodyTextStyle,
                ),
              ),
            if (currentInputValueObject.bmiResultInference ==
                ResultInference.slightlyOverweight)
              Expanded(
                child: Text(
                  kBMISlightlyOverweightInformationText,
                  style: kBMIInferenceSheetBodyTextStyle,
                ),
              ),
            if (currentInputValueObject.bmiResultInference ==
                ResultInference.overweight)
              Expanded(
                child: Text(
                  kBMIOverweightInformationText,
                  style: kBMIInferenceSheetBodyTextStyle,
                ),
              ),
            if (currentInputValueObject.bmiResultInference ==
                ResultInference.unrealisticInputs)
              Expanded(
                child: Text(
                  'The BMI you entered suggests an unlikely combination of height and weight. It\'s possible there may be an error in the values entered. Please confirm that your height and weight are entered correctly and try again.',
                  style: kBMIInferenceSheetBodyTextStyle,
                ),
              ),
          ],
        ),
        if (!currentInputValueObject.unrealisticInputsBoolean) kVerticalGap8,
        if (!currentInputValueObject.unrealisticInputsBoolean)
          const BMIDivider(),
        if (!currentInputValueObject.unrealisticInputsBoolean) kVerticalGap8,

        /// Tips Section.
        if (!currentInputValueObject.unrealisticInputsBoolean)
          Row(
            children: [
              kHorizontalGap4,
              Icon(
                FontAwesomeIcons.solidLightbulb,
                size: 18,
                color: kPrimaryBlue,
              ),
              kHorizontalGap4,
              Text(
                'Health Tips :',
                style: kCardHeadingTextStyle,
              ),
            ],
          ),
        if (!currentInputValueObject.unrealisticInputsBoolean) kVerticalGap8,
        if (!currentInputValueObject.unrealisticInputsBoolean)
          Row(
            //Tips Row
            mainAxisSize: MainAxisSize.min,
            children: [
              kHorizontalGap8,
              if (currentInputValueObject.bmiResultInference ==
                  ResultInference.underweight)
                Expanded(
                  child: Text(
                    kBMIUnderweightTipsText,
                    style: kBMIInferenceSheetBodyTextStyle,
                  ),
                ),
              if (currentInputValueObject.bmiResultInference ==
                  ResultInference.normal)
                Expanded(
                  child: Text(
                    kBMINormalTipsText,
                    style: kBMIInferenceSheetBodyTextStyle,
                  ),
                ),
              if (currentInputValueObject.bmiResultInference ==
                  ResultInference.slightlyOverweight)
                Expanded(
                  child: Text(
                    kBMISlightlyOverweightTipsText,
                    style: kBMIInferenceSheetBodyTextStyle,
                  ),
                ),
              if (currentInputValueObject.bmiResultInference ==
                  ResultInference.overweight)
                Expanded(
                  child: Text(
                    kBMIOverweightTipsText,
                    style: kBMIInferenceSheetBodyTextStyle,
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
