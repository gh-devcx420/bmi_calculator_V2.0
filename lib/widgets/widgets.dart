import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

// 1) Widget to Select Gender Tiles.
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
      height: 180,
      decoration: BoxDecoration(
        color: tileColour,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            tileIcon,
            size: 80,
            color: kPrimaryBlue,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            tileLabel,
            style: TextStyle(
              color: kPrimaryBlue,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// 1) Widget to Select Height Preferences (Feet or Centimeters).
class InputSelectorButton extends StatelessWidget {
  const InputSelectorButton({
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
        height: 34,
        width: 48,
        child: Center(
          child: Text(
            inputButtonText,
            style: TextStyle(
              color: buttonTextColour,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

// Widget to Set the value of Height in Feet
class FeetInputSlider extends StatefulWidget {
  const FeetInputSlider({required this.sliderSIUnitLabel, super.key});

  final String sliderSIUnitLabel;

  @override
  State<FeetInputSlider> createState() => _FeetInputSliderState();
}

class _FeetInputSliderState extends State<FeetInputSlider> {
  double feetslidervalue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 34,
          width: 75,
          decoration: BoxDecoration(
            color: kPrimaryBlue,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  feetslidervalue.toStringAsFixed(0),
                  style: TextStyle(
                    color: kPrimaryWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.sliderSIUnitLabel,
                  style: TextStyle(
                    color: kPrimaryWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
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
              min: 0.0,
              max: 7.0,
              divisions: 7,
              //label: feetslidervalue.round().toString(),
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

// Widget to Set the value of Height in Inches
class InchInputSlider extends StatefulWidget {
  const InchInputSlider({required this.sliderSIUnitLabel, super.key});

  final String sliderSIUnitLabel;

  @override
  State<InchInputSlider> createState() => _InchInputSliderState();
}

class _InchInputSliderState extends State<InchInputSlider> {
  double inchSliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 34,
          width: 75,
          decoration: BoxDecoration(
            color: kPrimaryBlue,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  inchSliderValue.toStringAsFixed(0),
                  style: TextStyle(
                    color: kPrimaryWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.sliderSIUnitLabel,
                  style: TextStyle(
                    color: kPrimaryWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
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
              min: 0.0,
              max: 11.0,
              divisions: 7,
              //label: inchSliderValue.round().toString(),
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
