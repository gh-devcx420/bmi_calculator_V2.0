import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// 1) Common APP BACKGROUND GRADIENT Container for BMI Calculator App.
class BMIBackgroundGradientContainer extends StatelessWidget {
  const BMIBackgroundGradientContainer({
    required this.currentScreen,
    super.key,
  });

  final Widget currentScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff001894),
            Color(0xff000c42),
          ],
        ),
      ),
      child: currentScreen,
    );
  }
}

/// 2) Common APP BAR for BMI Calculator App.
class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    required this.leadingIcon,
    required this.actionsIcon,
    required this.appBarLabel,
    super.key,
  });

  final IconData leadingIcon;
  final IconData? actionsIcon;
  final String appBarLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        kHorizontalGap4,
        Icon(
          leadingIcon,
          color: kPrimaryWhite,
          size: kAppBarIconSize,
        ),
        kHorizontalGap8,
        Text(
          appBarLabel,
          style: kAppBarTitleTextStyle,
        ),
        const Spacer(),
        Icon(
          actionsIcon,
          color: kPrimaryWhite,
          size: kAppBarHelpIconSize,
        ),
        kHorizontalGap8,
      ],
    );
  }
}

/// 3) Tile Widget to Display and Accept GENDER Selection.
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

/// 4) Button Widget to Select SI Unit of HEIGHT & WEIGHT to input the values.
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

/// 5) LABEL CHIP WIDGET to Display the selected GENDER values.
class TextLabelChip extends StatelessWidget {
  const TextLabelChip({
    required this.labelChipSIText,
    super.key,
  });

  final String labelChipSIText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kLabelChipVerticalPadding,
        horizontal: kLabelChipHorizontalPadding,
      ),
      margin: EdgeInsets.fromLTRB(0, 0, kLabelChipHorizontalMargin, 0),
      decoration: BoxDecoration(
        color: kPrimaryBlue,
        borderRadius: kSliderLabelRoundness,
      ),
      child: Center(
        child: Text(
          labelChipSIText,
          style: kLabelChipTextStyleWhite,
        ),
      ),
    );
  }
}

/// 6) LABEL CHIP WIDGET to Display the selected AGE,HEIGHT & WEIGHT values.
class ValueLabelChip extends StatelessWidget {
  const ValueLabelChip({
    required this.labelChipValue,
    required this.labelChipText,
    super.key,
  });

  final double labelChipValue;
  final String labelChipText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kLabelChipVerticalPadding,
        horizontal: kLabelChipHorizontalPadding,
      ),
      margin: EdgeInsets.fromLTRB(0, 0, kLabelChipHorizontalMargin, 0),
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
              labelChipValue.toStringAsFixed(0),
              style: kLabelChipTextStyleWhite,
            ),
            kHorizontalGap4,
            Text(
              labelChipText,
              style: kLabelChipTextStyleWhite,
            ),
          ],
        ),
      ),
    );
  }
}

/// 7) SLIDER WIDGET to Set the value of AGE, HEIGHT & WEIGHT Values.
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        ValueLabelChip(
          labelChipValue: widget.sliderValue,
          labelChipText: widget.sliderSIUnitLabel,
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

/// 8) BUTTON WIDGET to RESET the selected Input Values.
class ResetButton extends StatefulWidget {
  const ResetButton({
    required this.resetSliderValues,
    super.key,
  });

  final Function() resetSliderValues;

  @override
  State<ResetButton> createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.resetSliderValues,
      child: Container(
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
      ),
    );
  }
}

/// 9) BUTTON WIDGET to CALCULATE the RESULTS.
class CalculateResultsButton extends StatefulWidget {
  const CalculateResultsButton({
    required this.currentInputValues,
    super.key,
  });

  final CurrentInputValues currentInputValues;

  @override
  State<CalculateResultsButton> createState() => _CalculateResultsButtonState();
}

class _CalculateResultsButtonState extends State<CalculateResultsButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ResultScreen()),
        );
      },
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
