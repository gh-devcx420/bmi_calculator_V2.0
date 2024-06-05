import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///BMI Common Widgets: These Widgets are customizable.
// 1) General APP BACKGROUND GRADIENT Container for BMI Calculator App.
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

// 2) General APP BAR for BMI Calculator App.
class BMIAppBar extends StatelessWidget {
  const BMIAppBar({
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

// 3) General Tile Widget to Select, Accept & Display GENDER Selection.
class BMITile extends StatelessWidget {
  const BMITile({
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
            style: kGenderTileTextStyle,
          ),
        ],
      ),
    );
  }
}

// 4) General Button Widget to Select SI Unit of HEIGHT & WEIGHT SI Units respectively,.
class BMIInputMetricSelectorButton extends StatelessWidget {
  const BMIInputMetricSelectorButton({
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

// 5) TEXT DISPLAY CHIP WIDGET to Display the selected input values in Text Only.
class BMITextDisplayChip extends StatelessWidget {
  const BMITextDisplayChip({
    required this.chipText,
    required this.chipBackgroundColour,
    super.key,
  });

  final String chipText;
  final Color chipBackgroundColour;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kLabelChipVerticalPadding,
        horizontal: kLabelChipHorizontalPadding,
      ),
      margin: EdgeInsets.fromLTRB(0, 0, kLabelChipHorizontalMargin, 0),
      decoration: BoxDecoration(
        color: chipBackgroundColour,
        borderRadius: kValueLabelChipRoundness,
      ),
      child: Center(
        child: Text(
          chipText,
          style: kChipTextStyleWhite,
        ),
      ),
    );
  }
}

// 6) TEXT DISPLAY CHIP WIDGET to Display the selected input values in Number & SI Unit Text.
class BMIValueDisplayChip extends StatelessWidget {
  const BMIValueDisplayChip({
    required this.chipValue,
    required this.chipText,
    required this.chipColour,
    super.key,
  });

  final double chipValue;
  final String chipText;
  final Color chipColour;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kLabelChipVerticalPadding,
        horizontal: kLabelChipHorizontalPadding,
      ),
      margin: EdgeInsets.fromLTRB(0, 0, kLabelChipHorizontalMargin, 0),
      decoration: BoxDecoration(
        color: chipColour,
        borderRadius: kValueLabelChipRoundness,
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              chipValue.toStringAsFixed(0),
              style: kChipTextStyleWhite,
            ),
            kHorizontalGap4,
            Text(
              chipText,
              style: kChipTextStyleWhite,
            ),
          ],
        ),
      ),
    );
  }
}

// 7) SLIDER WIDGET to Set the value of AGE, HEIGHT or WEIGHT Values.
class BMISlider extends StatefulWidget {
  const BMISlider({
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
  State<BMISlider> createState() => BMISliderState();
}

class BMISliderState extends State<BMISlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        BMIValueDisplayChip(
          chipValue: widget.sliderValue,
          chipText: widget.sliderSIUnitLabel,
          chipColour: kPrimaryBlue,
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

// 8) General BMI Button to perform onTap actions.
class BMIButton extends StatelessWidget {
  const BMIButton({
    required this.onButtonTap,
    required this.buttonColour,
    required this.buttonRoundness,
    required this.buttonLabelText,
    required this.buttonLabelTextColour,
    required this.buttonLabelTextFontSize,
    required this.buttonHorizontalPadding,
    required this.buttonVerticalPadding,
    super.key,
  });

  final Function() onButtonTap;
  final Color buttonColour;
  final double buttonRoundness;
  final String buttonLabelText;
  final Color buttonLabelTextColour;
  final double buttonLabelTextFontSize;
  final double buttonHorizontalPadding;
  final double buttonVerticalPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: buttonHorizontalPadding,
          vertical: buttonVerticalPadding,
        ),
        decoration: BoxDecoration(
          color: buttonColour,
          borderRadius: BorderRadius.circular(buttonRoundness),
        ),
        child: Center(
          child: Text(
            buttonLabelText,
            style: TextStyle(
              color: buttonLabelTextColour,
              fontSize: buttonLabelTextFontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
