import 'package:flutter/material.dart';

import '../constants.dart';
import 'bmi_home_widgets.dart';

class BmiHome extends StatefulWidget {
  const BmiHome({super.key});

  @override
  State<BmiHome> createState() => _BmiHomeState();
}

class _BmiHomeState extends State<BmiHome> {
  double ageSliderValue = 0;

  void updateAgeSliderValue(double newValue) {
    setState(() {
      ageSliderValue = newValue;
    });
  }

  double feetSliderValue = 0;

  void updateFeetSliderValue(double newValue) {
    setState(() {
      feetSliderValue = newValue;
    });
  }

  double inchSliderValue = 0;

  void updateInchSliderValue(double newValue) {
    setState(() {
      inchSliderValue = newValue;
    });
  }

  double cmsSliderValue = 0;

  void updateCmsSliderValue(double newValue) {
    setState(() {
      cmsSliderValue = newValue;
    });
  }

  double kgsSliderValue = 0;

  void updateKgsSliderValue(double newValue) {
    setState(() {
      kgsSliderValue = newValue;
    });
  }

  double lbsSliderValue = 0;

  void updateLbsSliderValue(double newValue) {
    setState(() {
      lbsSliderValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          /// AppBar Row contains App Title & App Settings.
          const BMIAppBar(),
          kVerticalGap8,

          /// Gender Tiles to Select (Male/Female).
          const GenderSelectionCardRow(),
          kVerticalGap10,

          /// Age selection Card Widget.
          AgeSelectionCard(
            ageSliderValue: ageSliderValue,
            updateAgeSliderValue: updateAgeSliderValue,
          ),
          kVerticalGap10,

          /// Height selection Card Widget.
          HeightSelectionCard(
            feetSliderValue: feetSliderValue,
            updateFeetSliderValue: updateFeetSliderValue,
            inchSliderValue: inchSliderValue,
            updateInchSliderValue: updateInchSliderValue,
            cmsSliderValue: cmsSliderValue,
            updateCmsSliderValue: updateCmsSliderValue,
          ),
          kVerticalGap10,

          /// Weight selection Card Widget.
          WeightSelectionCard(
            kgsSliderValue: kgsSliderValue,
            updateKgsSliderValue: updateKgsSliderValue,
            lbsSliderValue: lbsSliderValue,
            updateLbsSliderValue: updateLbsSliderValue,
          ),

          /// Gap Between Card & Calculate Button.
          const Spacer(),

          /// Calculate & Reset Button Row.
          const CalculateAndResetButtons(),
          kVerticalGap10,
        ],
      ),
    );
  }
}
