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
      height: MediaQuery.of(context).size.height * kGenderTileHeightFactor,
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: buttonColour,
        borderRadius: kInputMetricSelectorButtonRoundness,
      ),
      height: screenHeight * kCardInputMetricSelectorButtonHeightFactor,
      width: screenWidth * kCardInputMetricSelectorButtonWidthFactor,
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
    );
  }
}

/// 3) SLIDER WIDGET to Set the value of AGE, HEIGHT & WEIGHT Values.
class CommonSlider extends StatefulWidget {
  const CommonSlider({
    required this.sliderSIUnitLabel,
    required this.sliderMinValue,
    required this.sliderMaxValue,
    required this.sliderValue,
    required this.updateSliderValue,
    super.key,
  });

  final String sliderSIUnitLabel;
  final double sliderValue;
  final double sliderMinValue;
  final double sliderMaxValue;
  final Function(double) updateSliderValue;

  @override
  State<CommonSlider> createState() => _CommonSliderState();
}

class _CommonSliderState extends State<CommonSlider> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: screenHeight * kSliderValueLabelHeightFactor,
          width: screenWidth * kSliderValueLabelWidthFactor,
          decoration: BoxDecoration(
            color: kPrimaryBlue,
            borderRadius: kSliderLabelRoundness,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.sliderValue.toStringAsFixed(0),
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
              value: widget.sliderValue,
              min: widget.sliderMinValue,
              max: widget.sliderMaxValue,
              divisions: widget.sliderMaxValue.toInt(),
              activeColor: kPrimaryBlue,
              inactiveColor: kSecondaryBlue,
              onChanged: (newValue) {
                setState(() {
                  widget.updateSliderValue(newValue);
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// 4) BUTTON WIDGET to RESET the selected Input Values.
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

/// 5) BUTTON WIDGET to CALCULATE the RESULTS.
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
