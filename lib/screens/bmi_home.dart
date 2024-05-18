import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Gender { none, male, female }

enum HeightMetric { feet, cms }

class BmiHome extends StatefulWidget {
  const BmiHome({super.key});

  @override
  State<BmiHome> createState() => _BmiHomeState();
}

class _BmiHomeState extends State<BmiHome> {
  Gender selectedGender = Gender.none;
  HeightMetric inputHeightMetric = HeightMetric.feet;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // AppBar Row contains App Title & App Settings
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calculate,
                color: kPrimaryWhite,
                size: 45,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'BMI Calculator',
                style: GoogleFonts.robotoCondensed(
                  color: kPrimaryWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.settings,
                color: kPrimaryWhite,
                size: 30,
              ),
              const SizedBox(
                width: 6,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          //Gender Tiles (To Select Male / Female)
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: GenderTile(
                      tileColour: selectedGender == Gender.male
                          ? kPrimaryWhite
                          : kSecondaryWhite,
                      tileIcon: Icons.male_rounded,
                      tileLabel: 'Male'),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: GenderTile(
                      tileColour: selectedGender == Gender.female
                          ? kPrimaryWhite
                          : kSecondaryWhite,
                      tileIcon: Icons.female_rounded,
                      tileLabel: 'Female'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              height: 200,
              decoration: BoxDecoration(
                color: kPrimaryWhite,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Select Inputs',
                        style: TextStyle(
                          color: kPrimaryBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            inputHeightMetric = HeightMetric.feet;
                          });
                        },
                        child: InputSelectorButton(
                          inputButtonText: 'Ft',
                          buttonColour: inputHeightMetric == HeightMetric.feet
                              ? kPrimaryBlue
                              : kPrimaryWhite,
                          buttonTextColour:
                              inputHeightMetric == HeightMetric.feet
                                  ? kPrimaryWhite
                                  : kPrimaryBlue,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            inputHeightMetric = HeightMetric.cms;
                          });
                        },
                        child: InputSelectorButton(
                          inputButtonText: 'Cm',
                          buttonColour: inputHeightMetric == HeightMetric.cms
                              ? kPrimaryBlue
                              : kPrimaryWhite,
                          buttonTextColour:
                              inputHeightMetric == HeightMetric.cms
                                  ? kPrimaryWhite
                                  : kPrimaryBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
