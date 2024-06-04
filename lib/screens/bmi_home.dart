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
  String bmiResultInference;

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
    this.bmiResultInference = '',
  });
}

CurrentInputValues currentInputValueObject = CurrentInputValues();
HeightMetric inputHeightMetric = HeightMetric.feet;
WeightMetric inputWeightMetric = WeightMetric.kgs;

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
    });
  }

  void calculateResults() {
    setState(() {
      double heightInMetersFromFeetAndInches = 0;
      heightInMetersFromFeetAndInches =
          (currentInputValueObject.feetSliderValue * 0.3048) +
              (currentInputValueObject.inchSliderValue * 0.0254);
      currentInputValueObject.bmiResult =
          currentInputValueObject.kgsSliderValue /
              pow(
                heightInMetersFromFeetAndInches,
                2,
              );

      if (currentInputValueObject.bmiResult <= kBMIUnderWeightLimit) {
        currentInputValueObject.bmiResultColour = kBMIUnderweightColour;
        currentInputValueObject.bmiResultInference = 'Underweight';
      } else if (currentInputValueObject.bmiResult <= kBMINormalLimit) {
        currentInputValueObject.bmiResultColour = kBMINormalColour;
        currentInputValueObject.bmiResultInference = 'Normal';
      } else {
        currentInputValueObject.bmiResultColour = kBMIOverWeightColour;
        currentInputValueObject.bmiResultInference = 'Overweight';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// AppBar Row contains App Title & App Settings.
        const CommonAppBar(
          leadingIcon: Icons.person_pin_outlined,
          appBarLabel: 'BMI Calculator',
          actionsIcon: Icons.help,
        ),
        kVerticalGap8,

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
        CalculateAndResetButtons(
          resetSliderValues: resetSliderValues,
          calculateResults: calculateResults,
        ),
        kVerticalGap10,
      ],
    );
  }
}
