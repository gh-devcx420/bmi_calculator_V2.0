import 'package:flutter/material.dart';

import '../constants.dart';
import 'bmi_home_widgets.dart';

class BmiHome extends StatefulWidget {
  const BmiHome({super.key});

  @override
  State<BmiHome> createState() => _BmiHomeState();
}

class _BmiHomeState extends State<BmiHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const BMIAppBar(),
          // AppBar Row contains App Title & App Settings.
          kVerticalGap8,
          const GenderSelectionCardRow(),
          // Gender Tiles to Select Male/Female).
          kVerticalGap10,
          const AgeSelectionCard(),
          // Age selection Card Widget.
          kVerticalGap10,
          const HeightSelectionCard(),
          // Height selection Card Widget.
          kVerticalGap10,
          const WeightSelectionCard(),
          // Weight selection Card Widget.
          const Spacer(),
          // Gap Between Card & Calculate Button.
          const CalculateAndResetButtons(),
          // Calculate & Reset Button Row.
          kVerticalGap10,
        ],
      ),
    );
  }
}
