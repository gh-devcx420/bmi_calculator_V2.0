import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

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
        width: 38,
        child: Center(
            child: Text(
          inputButtonText,
          style: TextStyle(
            color: buttonTextColour,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }
}
