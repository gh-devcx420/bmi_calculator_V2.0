import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// 1) Tile Widget to Display and Accept Gender Selection.
class GenderTile extends StatelessWidget {
  const GenderTile({
    super.key,
    required this.tileColour,
    required this.tileIcon,
    required this.tileLabel,
  });

  final Color tileColour;
  final IconData tileIcon;
  final String tileLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(0),
      height: kGenderTileHeight,
      decoration: BoxDecoration(
        color: tileColour,
        borderRadius: kGenderTileCardRoundness,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            tileIcon,
            size: 75,
            color: kPrimaryBlue,
          ),
          kVerticalGap10,
          Text(
            tileLabel,
            style: GoogleFonts.robotoCondensed(
              color: kPrimaryBlue,
              fontSize: kGenderTileTitleFontSize,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

/// 2) Button Widget to Select SI Unit of Height & Weight to input the values.
class InputMetricSelectorButton extends StatelessWidget {
  const InputMetricSelectorButton({
    super.key,
    required this.inputButtonText,
    required this.buttonColour,
    required this.buttonTextColour,
  });

  final String inputButtonText;
  final Color buttonColour;
  final Color buttonTextColour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        decoration: BoxDecoration(
          color: buttonColour,
          borderRadius: BorderRadius.circular(17),
        ),
        height: kCardInputSelectorButtonHeight,
        width: kCardInputSelectorButtonWidth,
        child: Center(
          child: Text(
            inputButtonText,
            style: GoogleFonts.robotoCondensed(
              color: buttonTextColour,
              fontSize: kInputMetricSelectorButtonTextFontSize,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

/// 3) SLIDER WIDGET to Set the value of HEIGHT in FEET.
class FeetInputSlider extends StatefulWidget {
  const FeetInputSlider({required this.sliderSIUnitLabel, super.key});

  final String sliderSIUnitLabel;

  @override
  State<FeetInputSlider> createState() => _FeetInputSliderState();
}

class _FeetInputSliderState extends State<FeetInputSlider> {
  double feetslidervalue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: kHeightSliderValueLabelHeight,
          width: kHeightSliderValueLabelWidth,
          decoration: BoxDecoration(
            color: kPrimaryBlue,
            borderRadius: kHeightSliderValueLabelRoundness,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  feetslidervalue.toStringAsFixed(0),
                  style: kSliderLabelTextStyleWhite,
                ),
                kHorizontalGap4,
                Text(
                  widget.sliderSIUnitLabel,
                  style: kSliderLabelTextStyleWhite,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTickMarkColor: Colors.transparent, // Hide active ticks
              inactiveTickMarkColor: Colors.transparent, // Hide inactive ticks
            ),
            child: Slider(
              value: feetslidervalue,
              min: kFeetSliderMinValue,
              max: kFeetSliderMaxValue,
              divisions: kFeetSliderMaxValue.toInt(),
              activeColor: kPrimaryBlue,
              inactiveColor: kSecondaryBlue,
              onChanged: (newValue) {
                setState(() {
                  feetslidervalue = newValue;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// 4) SLIDER WIDGET to Set the value of HEIGHT in INCHES.
class InchInputSlider extends StatefulWidget {
  const InchInputSlider({required this.sliderSIUnitLabel, super.key});

  final String sliderSIUnitLabel;

  @override
  State<InchInputSlider> createState() => _InchInputSliderState();
}

class _InchInputSliderState extends State<InchInputSlider> {
  double inchSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: kHeightSliderValueLabelHeight,
          width: kHeightSliderValueLabelWidth,
          decoration: BoxDecoration(
            color: kPrimaryBlue,
            borderRadius: kHeightSliderValueLabelRoundness,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  inchSliderValue.toStringAsFixed(0),
                  style: kSliderLabelTextStyleWhite,
                ),
                kHorizontalGap4,
                Text(
                  widget.sliderSIUnitLabel,
                  style: kSliderLabelTextStyleWhite,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTickMarkColor: Colors.transparent, // Hide active ticks
              inactiveTickMarkColor: Colors.transparent, // Hide inactive ticks
            ),
            child: Slider(
              value: inchSliderValue,
              min: kInchSliderMinValue,
              max: kInchSliderMaxValue,
              divisions: kInchSliderMaxValue.toInt(),
              activeColor: kPrimaryBlue,
              inactiveColor: kSecondaryBlue,
              onChanged: (newValue) {
                setState(() {
                  inchSliderValue = newValue;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// 5) SLIDER WIDGET to Set the value of HEIGHT in CENTIMETERS.
class CmsInputSlider extends StatefulWidget {
  const CmsInputSlider({required this.sliderSIUnitLabel, super.key});

  final String sliderSIUnitLabel;

  @override
  State<CmsInputSlider> createState() => _CmsInputSliderState();
}

class _CmsInputSliderState extends State<CmsInputSlider> {
  double cmsSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: kHeightSliderValueLabelHeight,
          width: kHeightSliderValueLabelWidth,
          decoration: BoxDecoration(
            color: kPrimaryBlue,
            borderRadius: kHeightSliderValueLabelRoundness,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cmsSliderValue.toStringAsFixed(0),
                  style: kSliderLabelTextStyleWhite,
                ),
                kHorizontalGap4,
                Text(
                  widget.sliderSIUnitLabel,
                  style: kSliderLabelTextStyleWhite,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTickMarkColor: Colors.transparent, // Hide active ticks
              inactiveTickMarkColor: Colors.transparent, // Hide inactive ticks
            ),
            child: Slider(
              value: cmsSliderValue,
              min: kCmsSliderMinValue,
              max: kCmsSliderMaxValue,
              divisions: kCmsSliderMaxValue.toInt(),
              activeColor: kPrimaryBlue,
              inactiveColor: kSecondaryBlue,
              onChanged: (newValue) {
                setState(() {
                  cmsSliderValue = newValue;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// 6) SLIDER WIDGET to Set the value of WEIGHT in KILOGRAMS.
class KgsInputSlider extends StatefulWidget {
  const KgsInputSlider({required this.sliderSIUnitLabel, super.key});

  final String sliderSIUnitLabel;

  @override
  State<KgsInputSlider> createState() => _KgsInputSliderState();
}

class _KgsInputSliderState extends State<KgsInputSlider> {
  double kgsSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: kWeightSliderValueLabelHeight,
          width: kWeightSliderValueLabelWidth,
          decoration: BoxDecoration(
            color: kPrimaryBlue,
            borderRadius: kWeightSliderValueLabelRoundness,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  kgsSliderValue.toStringAsFixed(0),
                  style: kSliderLabelTextStyleWhite,
                ),
                kHorizontalGap4,
                Text(
                  widget.sliderSIUnitLabel,
                  style: kSliderLabelTextStyleWhite,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTickMarkColor: Colors.transparent,
              inactiveTickMarkColor: Colors.transparent,
            ),
            child: Slider(
              value: kgsSliderValue,
              min: kKgsSliderMinValue,
              max: kKgsSliderMaxValue,
              divisions: kKgsSliderMaxValue.toInt(),
              activeColor: kPrimaryBlue,
              inactiveColor: kSecondaryBlue,
              onChanged: (newValue) {
                setState(() {
                  kgsSliderValue = newValue;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// 7) SLIDER WIDGET to Set the value of WEIGHT in POUNDS.
class LbsInputSlider extends StatefulWidget {
  const LbsInputSlider({required this.sliderSIUnitLabel, super.key});

  final String sliderSIUnitLabel;

  @override
  State<LbsInputSlider> createState() => _LbsInputSliderState();
}

class _LbsInputSliderState extends State<LbsInputSlider> {
  double kLbsSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: kWeightSliderValueLabelHeight,
          width: kWeightSliderValueLabelWidth,
          decoration: BoxDecoration(
            color: kPrimaryBlue,
            borderRadius: kWeightSliderValueLabelRoundness,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  kLbsSliderValue.toStringAsFixed(0),
                  style: kSliderLabelTextStyleWhite,
                ),
                kHorizontalGap4,
                Text(
                  widget.sliderSIUnitLabel,
                  style: kSliderLabelTextStyleWhite,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTickMarkColor: Colors.transparent, // Hide active ticks
              inactiveTickMarkColor: Colors.transparent, // Hide inactive ticks
            ),
            child: Slider(
              value: kLbsSliderValue,
              min: kLbsSliderMinValue,
              max: kLbsSliderMaxValue,
              divisions: kLbsSliderMaxValue.toInt(),
              //label: inchSliderValue.round().toString(),
              activeColor: kPrimaryBlue,
              inactiveColor: kSecondaryBlue,
              onChanged: (newValue) {
                setState(() {
                  kLbsSliderValue = newValue;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// 8) SLIDER WIDGET to Set the value of AGE in YEARS.
class AgeInputSlider extends StatefulWidget {
  const AgeInputSlider({required this.sliderSIUnitLabel, super.key});

  final String sliderSIUnitLabel;

  @override
  State<AgeInputSlider> createState() => _AgeInputSliderState();
}

class _AgeInputSliderState extends State<AgeInputSlider> {
  double kAgeSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: kAgeSliderValueLabelHeight,
          width: kAgeSliderValueLabelWidth,
          decoration: BoxDecoration(
            color: kPrimaryBlue,
            borderRadius: kAgeSliderValueLabelRoundness,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  kAgeSliderValue.toStringAsFixed(0),
                  style: kSliderLabelTextStyleWhite,
                ),
                kHorizontalGap4,
                Text(
                  widget.sliderSIUnitLabel,
                  style: kSliderLabelTextStyleWhite,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTickMarkColor: Colors.transparent, // Hide active ticks
              inactiveTickMarkColor: Colors.transparent, // Hide inactive ticks
            ),
            child: Slider(
              value: kAgeSliderValue,
              min: kAgeSliderMinValue,
              max: kAgeSliderMaxValue,
              divisions: kAgeSliderMaxValue.toInt(),
              //label: inchSliderValue.round().toString(),
              activeColor: kPrimaryBlue,
              inactiveColor: kSecondaryBlue,
              onChanged: (newValue) {
                setState(() {
                  kAgeSliderValue = newValue;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// 9) BUTTON WIDGET to RESET the selected Input Values.
class ResetButton extends StatefulWidget {
  const ResetButton({super.key});

  @override
  State<ResetButton> createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kResetButtonHeight,
      width: kResetButtonWidth,
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
          kHorizontalGap8,
          Text(
            'Reset',
            style: kResetButtonTextStyle,
          ),
        ],
      ),
    );
  }
}

/// 10) BUTTON WIDGET to CALCULATE the RESULTS.
class CalculateResultsButton extends StatefulWidget {
  const CalculateResultsButton({super.key});

  @override
  State<CalculateResultsButton> createState() => _CalculateResultsButtonState();
}

class _CalculateResultsButtonState extends State<CalculateResultsButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: kCalculateButtonHeight,
        decoration: BoxDecoration(
          color: kPrimaryWhite,
          borderRadius: kCalculateButtonRoundness,
        ),
        child: Center(
          child: Text(
            'Calculate Results',
            style: kCalculateButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
