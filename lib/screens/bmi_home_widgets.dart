import 'package:bmi_calculator/common_widgets/widgets.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import '../enums.dart';

/// 1) APP BAR for BMI Calculator HomeScreen.
class BMIAppBar extends StatelessWidget {
  const BMIAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.calculate,
          color: kPrimaryWhite,
          size: kAppBarIconSize,
        ),
        kHorizontalGap8,
        Text(
          'BMI Calculator',
          style: kAppBarTitleTextStyle,
        ),
        const Spacer(),
        Icon(
          Icons.help,
          color: kPrimaryWhite,
          size: kAppBarHelpIconSize,
        ),
        kHorizontalGap8,
      ],
    );
  }
}

/// 2) Card Widget to Select the GENDER values.
class GenderSelectionCardRow extends StatefulWidget {
  const GenderSelectionCardRow({super.key});

  @override
  State<GenderSelectionCardRow> createState() => _GenderSelectionCardRowState();
}

class _GenderSelectionCardRowState extends State<GenderSelectionCardRow> {
  Gender selectedGender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              tileLabel: 'Male',
            ),
          ),
        ),
        kHorizontalGap10,
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
              tileLabel: 'Female',
            ),
          ),
        ),
      ],
    );
  }
}

/// 3) Card Widget to accept input HEIGHT values.
class HeightSelectionCard extends StatefulWidget {
  const HeightSelectionCard({super.key});

  @override
  State<HeightSelectionCard> createState() => _HeightSelectionCardState();
}

class _HeightSelectionCardState extends State<HeightSelectionCard> {
  HeightMetric inputHeightMetric = HeightMetric.feet;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kHeightSelectionCardVerticalPadding,
        horizontal: kHeightSelectionCardHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: kPrimaryWhite,
        borderRadius: kHeightSelectionCardRoundness,
      ),
      child: Column(
        children: [
          Row(
            children: [
              kHorizontalGap10,
              Text(
                'Height',
                style: kCardTitleTextStyle,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    inputHeightMetric = HeightMetric.feet;
                  });
                },
                child: InputMetricSelectorButton(
                  inputButtonText: 'Ft',
                  buttonColour: inputHeightMetric == HeightMetric.feet
                      ? kPrimaryBlue
                      : kPrimaryWhite,
                  buttonTextColour: inputHeightMetric == HeightMetric.feet
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
                child: InputMetricSelectorButton(
                  inputButtonText: 'Cms',
                  buttonColour: inputHeightMetric == HeightMetric.cms
                      ? kPrimaryBlue
                      : kPrimaryWhite,
                  buttonTextColour: inputHeightMetric == HeightMetric.cms
                      ? kPrimaryWhite
                      : kPrimaryBlue,
                ),
              ),
            ],
          ),
          inputHeightMetric == HeightMetric.feet
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const FeetInputSlider(
                      sliderSIUnitLabel: 'Feet',
                    ),
                    kVerticalGap4,
                    const InchInputSlider(
                      sliderSIUnitLabel: 'Inches',
                    ),
                  ],
                )
              : const CmsInputSlider(
                  sliderSIUnitLabel: 'Cms',
                ),
          kVerticalGap10,
        ],
      ),
    );
  }
}

/// 4) Card Widget to accept input WEIGHT values.
class WeightSelectionCard extends StatefulWidget {
  const WeightSelectionCard({super.key});

  @override
  State<WeightSelectionCard> createState() => _WeightSelectionCardState();
}

class _WeightSelectionCardState extends State<WeightSelectionCard> {
  WeightMetric inputWeightMetric = WeightMetric.kgs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kWeightSelectionCardVerticalPadding,
        horizontal: kWeightSelectionCardHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: kPrimaryWhite,
        borderRadius: kWeightSelectionCardRoundness,
      ),
      child: Column(
        children: [
          Row(
            children: [
              kHorizontalGap10,
              Text(
                'Weight',
                style: kCardTitleTextStyle,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    inputWeightMetric = WeightMetric.kgs;
                  });
                },
                child: InputMetricSelectorButton(
                  inputButtonText: 'Kgs',
                  buttonColour: inputWeightMetric == WeightMetric.kgs
                      ? kPrimaryBlue
                      : kPrimaryWhite,
                  buttonTextColour: inputWeightMetric == WeightMetric.kgs
                      ? kPrimaryWhite
                      : kPrimaryBlue,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    inputWeightMetric = WeightMetric.pounds;
                  });
                },
                child: InputMetricSelectorButton(
                  inputButtonText: 'lbs',
                  buttonColour: inputWeightMetric == WeightMetric.pounds
                      ? kPrimaryBlue
                      : kPrimaryWhite,
                  buttonTextColour: inputWeightMetric == WeightMetric.pounds
                      ? kPrimaryWhite
                      : kPrimaryBlue,
                ),
              ),
            ],
          ),
          inputWeightMetric == WeightMetric.kgs
              ? const KgsInputSlider(
                  sliderSIUnitLabel: 'Kgs',
                )
              : const LbsInputSlider(
                  sliderSIUnitLabel: 'Pounds',
                ),
          kVerticalGap10,
        ],
      ),
    );
  }
}

/// 5) Card Widget to accept input AGE values.
class AgeSelectionCard extends StatefulWidget {
  const AgeSelectionCard({super.key});

  @override
  State<AgeSelectionCard> createState() => _AgeSelectionCardState();
}

class _AgeSelectionCardState extends State<AgeSelectionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kAgeSelectionCardVerticalPadding,
        horizontal: kAgeSelectionCardHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: kPrimaryWhite,
        borderRadius: kAgeSelectionCardRoundness,
      ),
      child: Column(
        children: [
          Row(
            children: [
              kHorizontalGap10,
              Text(
                'Age',
                style: kCardTitleTextStyle,
              ),
              const Spacer(),
              InputMetricSelectorButton(
                inputButtonText: 'Years',
                buttonColour: kPrimaryBlue,
                buttonTextColour: kPrimaryWhite,
              ),
            ],
          ),
          const AgeInputSlider(sliderSIUnitLabel: 'Years'),
          kVerticalGap10,
        ],
      ),
    );
  }
}

/// 6) Row Widget to display RESET & CALCULATE Buttons.
class CalculateAndResetButtons extends StatefulWidget {
  const CalculateAndResetButtons({super.key});

  @override
  State<CalculateAndResetButtons> createState() =>
      _CalculateAndResetButtonsState();
}

class _CalculateAndResetButtonsState extends State<CalculateAndResetButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const ResetButton(),
        kHorizontalGap8,
        const Expanded(
          child: CalculateResultsButton(),
        ),
      ],
    );
  }
}
