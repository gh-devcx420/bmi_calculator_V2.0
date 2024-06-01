import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/enums.dart';
import 'package:bmi_calculator/screens/bmi_home_widgets.dart';
import 'package:bmi_calculator/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

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
      currentInputValues.selectedGender = Gender.male;
    });
  }

  void selectFemaleCard() {
    setState(() {
      currentInputValues.selectedGender = Gender.female;
    });
  }

  void updateAgeSliderValue(double newValue) {
    setState(() {
      currentInputValues.ageSliderValue = newValue;
    });
  }

  void updateFeetSliderValue(double newValue) {
    setState(() {
      currentInputValues.feetSliderValue = newValue;
    });
  }

  void updateInchSliderValue(double newValue) {
    setState(() {
      currentInputValues.inchSliderValue = newValue;
    });
  }

  void updateCmsSliderValue(double newValue) {
    setState(() {
      currentInputValues.cmsSliderValue = newValue;
    });
  }

  void updateKgsSliderValue(double newValue) {
    setState(() {
      currentInputValues.kgsSliderValue = newValue;
    });
  }

  void updateLbsSliderValue(double newValue) {
    setState(() {
      currentInputValues.lbsSliderValue = newValue;
    });
  }

  void resetSliderValues() {
    setState(() {
      currentInputValues.selectedGender = Gender.none;
      currentInputValues.ageSliderValue = 0;
      currentInputValues.feetSliderValue = 0;
      currentInputValues.inchSliderValue = 0;
      currentInputValues.cmsSliderValue = 0;
      currentInputValues.kgsSliderValue = 0;
      currentInputValues.lbsSliderValue = 0;
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
          currentGenderSelection: currentInputValues.selectedGender,
        ),
        kVerticalGap10,

        /// Age selection Card Widget.
        AgeSelectionCard(
          ageSliderValue: currentInputValues.ageSliderValue,
          updateAgeSliderValue: updateAgeSliderValue,
        ),
        kVerticalGap10,

        /// Height selection Card Widget.
        HeightSelectionCard(
          feetSliderValue: currentInputValues.feetSliderValue,
          updateFeetSliderValue: updateFeetSliderValue,
          inchSliderValue: currentInputValues.inchSliderValue,
          updateInchSliderValue: updateInchSliderValue,
          cmsSliderValue: currentInputValues.cmsSliderValue,
          updateCmsSliderValue: updateCmsSliderValue,
        ),
        kVerticalGap10,

        /// Weight selection Card Widget.
        WeightSelectionCard(
          kgsSliderValue: currentInputValues.kgsSliderValue,
          updateKgsSliderValue: updateKgsSliderValue,
          lbsSliderValue: currentInputValues.lbsSliderValue,
          updateLbsSliderValue: updateLbsSliderValue,
        ),

        /// Gap Between Card & Calculate Button.
        const Spacer(),

        /// Calculate & Reset Button Row.
        CalculateAndResetButtons(
          resetSliderValues: resetSliderValues,
          currentInputValues: currentInputValues,
        ),
        kVerticalGap10,
      ],
    );
  }
}
