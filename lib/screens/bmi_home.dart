import 'dart:math';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/enums.dart';
import 'package:bmi_calculator/widgets/bmi_home_widgets.dart';
import 'package:bmi_calculator/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class CurrentInputValues {
  Gender selectedGender;
  double ageSliderValue;
  double feetSliderValue;
  double inchSliderValue;
  double cmsSliderValue;
  double kgsSliderValue;
  double lbsSliderValue;
  double bmiResult;
  Color bmiResultColour;
  String bmiResultInferenceText;
  ResultInference bmiResultInference;
  bool unrealisticInputsBoolean;

  CurrentInputValues({
    this.selectedGender = Gender.none,
    this.ageSliderValue = 0,
    this.feetSliderValue = 0,
    this.inchSliderValue = 0,
    this.cmsSliderValue = 0,
    this.kgsSliderValue = 0,
    this.lbsSliderValue = 0,
    this.bmiResult = 0,
    this.bmiResultColour = Colors.grey,
    this.bmiResultInferenceText = '',
    this.bmiResultInference = ResultInference.none,
    this.unrealisticInputsBoolean = false,
  });
}

CurrentInputValues currentInputValueObject = CurrentInputValues();
HeightMetric currentHeightMetric = HeightMetric.feetinches;
WeightMetric currentWeightMetric = WeightMetric.kgs;

class BmiHome extends StatefulWidget {
  const BmiHome({
    super.key,
  });

  @override
  State<BmiHome> createState() => _BmiHomeState();
}

class _BmiHomeState extends State<BmiHome> {
  void selectMaleCard() {
    setState(() {
      currentInputValueObject.selectedGender = Gender.male;
    });
  }

  void selectFemaleCard() {
    setState(() {
      currentInputValueObject.selectedGender = Gender.female;
    });
  }

  void updateAgeSliderValue(double newValue) {
    setState(() {
      currentInputValueObject.ageSliderValue = newValue;
    });
  }

  void updateFeetSliderValue(double newValue) {
    setState(() {
      currentInputValueObject.feetSliderValue = newValue;
    });
  }

  void updateInchSliderValue(double newValue) {
    setState(() {
      currentInputValueObject.inchSliderValue = newValue;
    });
  }

  void updateCmsSliderValue(double newValue) {
    setState(() {
      currentInputValueObject.cmsSliderValue = newValue;
    });
  }

  void updateKgsSliderValue(double newValue) {
    setState(() {
      currentInputValueObject.kgsSliderValue = newValue;
    });
  }

  void updateLbsSliderValue(double newValue) {
    setState(() {
      currentInputValueObject.lbsSliderValue = newValue;
    });
  }

  void resetSliderValues() {
    setState(() {
      currentInputValueObject.selectedGender = Gender.none;
      currentInputValueObject.ageSliderValue = 0;
      currentInputValueObject.feetSliderValue = 0;
      currentInputValueObject.inchSliderValue = 0;
      currentInputValueObject.cmsSliderValue = 0;
      currentInputValueObject.kgsSliderValue = 0;
      currentInputValueObject.lbsSliderValue = 0;
      currentInputValueObject.bmiResult = 0;
      currentInputValueObject.bmiResultColour = Colors.grey;
      currentInputValueObject.bmiResultInferenceText = '';
      currentInputValueObject.bmiResultInference = ResultInference.none;
      currentInputValueObject.unrealisticInputsBoolean = false;
    });
  }

  void calculateResults() {
    setState(() {
      double heightInMetersFromFeetAndInches =
          (currentInputValueObject.feetSliderValue * 0.3048) +
              (currentInputValueObject.inchSliderValue * 0.0254);
      double heightInMetersFromCms =
          currentInputValueObject.cmsSliderValue / 100;
      double weightInKgsFromPounds =
          currentInputValueObject.lbsSliderValue / 2.20462;

      if (currentHeightMetric == HeightMetric.feetinches) {
        if (currentWeightMetric == WeightMetric.kgs) {
          currentInputValueObject.bmiResult =
              currentInputValueObject.kgsSliderValue /
                  pow(
                    heightInMetersFromFeetAndInches,
                    2,
                  );
        } else {
          currentInputValueObject.bmiResult = weightInKgsFromPounds /
              pow(
                heightInMetersFromFeetAndInches,
                2,
              );
        }
      } else {
        if (currentWeightMetric == WeightMetric.kgs) {
          currentInputValueObject.bmiResult =
              currentInputValueObject.kgsSliderValue /
                  pow(
                    heightInMetersFromCms,
                    2,
                  );
        } else {
          currentInputValueObject.bmiResult = weightInKgsFromPounds /
              pow(
                heightInMetersFromCms,
                2,
              );
        }
      }

      if (currentInputValueObject.bmiResult < 10) {
        currentInputValueObject.bmiResultColour = kBMIErrorColour;
        currentInputValueObject.bmiResultInference =
            ResultInference.unrealisticInputs;
        currentInputValueObject.unrealisticInputsBoolean = true;
        currentInputValueObject.bmiResultInferenceText = 'Unrealistic Inputs';
      } else if (currentInputValueObject.bmiResult <= kBMIUnderWeightLimit) {
        currentInputValueObject.bmiResultInferenceText = 'Underweight';
        currentInputValueObject.bmiResultInference =
            ResultInference.underweight;
        currentInputValueObject.bmiResultColour = kBMIUnderweightColour;
        currentInputValueObject.unrealisticInputsBoolean = false;
      } else if (currentInputValueObject.bmiResult <= kBMINormalLimit) {
        currentInputValueObject.bmiResultInferenceText = 'Normal';
        currentInputValueObject.bmiResultInference = ResultInference.normal;
        currentInputValueObject.bmiResultColour = kBMINormalColour;
        currentInputValueObject.unrealisticInputsBoolean = false;
      } else if (currentInputValueObject.bmiResult <=
          kBMISlightlyOverWeightLimit) {
        currentInputValueObject.bmiResultInferenceText = 'Slightly Overweight';
        currentInputValueObject.bmiResultInference =
            ResultInference.slightlyOverweight;
        currentInputValueObject.bmiResultColour = kBMISlightlyOverWeightColour;
        currentInputValueObject.unrealisticInputsBoolean = false;
      } else if (currentInputValueObject.bmiResult <= kBMIOverWeightLimit) {
        currentInputValueObject.bmiResultInferenceText = 'Overweight';
        currentInputValueObject.bmiResultInference = ResultInference.overweight;
        currentInputValueObject.bmiResultColour = kBMIOverWeightColour;
        currentInputValueObject.unrealisticInputsBoolean = false;
      } else {
        currentInputValueObject.bmiResultInferenceText = 'Unrealistic Inputs';
        currentInputValueObject.bmiResultInference =
            ResultInference.unrealisticInputs;
        currentInputValueObject.bmiResultColour = kBMIErrorColour;
        currentInputValueObject.unrealisticInputsBoolean = true;
      }
    });
  }

  void showBMIHelpDialogue(BuildContext context) {
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
                  'Body Mass Index',
                  style: kAlertDialogueHeadingTextStyle,
                ),
                kVerticalGap10,
                kVerticalGap10,
                Image.asset('assets/images/BMI.png'),
                kVerticalGap10,
                Text(
                  kBMIHelpText,
                  style: kBMIHelpInfoTextStyle,
                ),
                kVerticalGap10,
                Text(
                  kBMIFormulaText,
                  style: kBMIHelpInfoTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                kVerticalGap10,
                Text(
                  kBMIFormulaInference,
                  style: kBMIHelpInfoTextStyle,
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
    return Column(
      children: [
        /// AppBar Row contains App Title & Help Icon.
        BMIAppBar(
          leadingIcon: Icons.person_pin_outlined,
          appBarLabel: 'BMI Calculator',
          actionsIcon: Icons.help,
          onActionsIconTap: showBMIHelpDialogue,
        ),

        /// Gender Tiles to Select (Male/Female).
        GenderSelectionCardRow(
          selectMaleCard: selectMaleCard,
          selectFemaleCard: selectFemaleCard,
        ),
        kVerticalGap10,

        /// Age selection Card Widget.
        AgeSelectionCard(
          updateAgeSliderValue: updateAgeSliderValue,
        ),
        kVerticalGap10,

        /// Height selection Card Widget.
        HeightSelectionCard(
          updateFeetSliderValue: updateFeetSliderValue,
          updateInchSliderValue: updateInchSliderValue,
          updateCmsSliderValue: updateCmsSliderValue,
        ),
        kVerticalGap10,

        /// Weight selection Card Widget.
        WeightSelectionCard(
          updateKgsSliderValue: updateKgsSliderValue,
          updateLbsSliderValue: updateLbsSliderValue,
        ),

        /// Gap Between Card & Calculate Button.
        const Spacer(),

        /// Calculate & Reset Button Row.
        CalculateAndResetButtonsRow(
          resetSliderValues: resetSliderValues,
          calculateResults: calculateResults,
        ),
        kVerticalGap10,
      ],
    );
  }
}
