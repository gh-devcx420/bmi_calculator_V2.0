import 'package:bmi_calculator/enums.dart';
import 'package:bmi_calculator/screens/bmi_home.dart';
import 'package:bmi_calculator/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class CurrentInputValues {
  double ageSliderValue;
  double feetSliderValue;
  double inchSliderValue;
  double cmsSliderValue;
  double kgsSliderValue;
  double lbsSliderValue;
  Gender selectedGender;

  CurrentInputValues({
    this.ageSliderValue = 0,
    this.feetSliderValue = 0,
    this.inchSliderValue = 0,
    this.cmsSliderValue = 0,
    this.kgsSliderValue = 0,
    this.lbsSliderValue = 0,
    this.selectedGender = Gender.none,
  });
}

CurrentInputValues currentInputValues = CurrentInputValues();
HeightMetric inputHeightMetric = HeightMetric.feet;
WeightMetric inputWeightMetric = WeightMetric.kgs;

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BMIBackgroundGradientContainer(
          currentScreen: SafeArea(
            child: BmiHome(),
          ),
        ),
      ),
    );
  }
}
