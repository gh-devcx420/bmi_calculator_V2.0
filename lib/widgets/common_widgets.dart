import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/enums.dart';
import 'package:bmi_calculator/screens/bmi_home.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kInputMetricSelectorButtonVerticalPadding,
        horizontal: kInputMetricSelectorButtonHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: buttonColour,
        borderRadius: kInputMetricSelectorButtonRoundness,
      ),
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
class TextLabel extends StatelessWidget {
  const TextLabel({
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
        borderRadius: kValueLabelChipRoundness,
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
class ValueTextLabel extends StatelessWidget {
  const ValueTextLabel({
    required this.valueLabelChipValue,
    required this.valueLabelChipText,
    super.key,
  });

  final double valueLabelChipValue;
  final String valueLabelChipText;

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
        borderRadius: kValueLabelChipRoundness,
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              valueLabelChipValue.toStringAsFixed(0),
              style: kLabelChipTextStyleWhite,
            ),
            kHorizontalGap4,
            Text(
              valueLabelChipText,
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
  State<CommonSlider> createState() => CommonSliderState();
}

class CommonSliderState extends State<CommonSlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        ValueTextLabel(
          valueLabelChipValue: widget.sliderValue,
          valueLabelChipText: widget.sliderSIUnitLabel,
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
class BMIIconTextButton extends StatelessWidget {
  const BMIIconTextButton({
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
class BMITextButton extends StatelessWidget {
  const BMITextButton({
    required this.calculateResults,
    super.key,
  });

  final Function() calculateResults;

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
        }
      },
      child: Container(
        height: kCalculateButtonHeight,
        width: kCalculateButtonWidth,
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

/// 10) LABEL WIDGET to Display the BMI RESULTS SCORE.
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
          height: 40,
          child: Center(
            child: Text(
              currentInputValueObject.bmiResult.toStringAsFixed(2),
              style: GoogleFonts.robotoCondensed(
                color: kPrimaryWhite,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// 11) GAUGE WIDGET to Display the BMI RESULTS SCORE in a visibly neat Gauge Scale.
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
