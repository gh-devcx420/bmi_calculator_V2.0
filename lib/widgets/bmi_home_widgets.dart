import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/enums.dart';
import 'package:bmi_calculator/screens/bmi_home.dart';
import 'package:bmi_calculator/widgets/basic_widgets.dart';
import 'package:bmi_calculator/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

/// 1) Card Row Widget to Select the GENDER values.
class GenderSelectionCardRow extends StatelessWidget {
  const GenderSelectionCardRow({
    required this.selectMaleCard,
    required this.selectFemaleCard,
    super.key,
  });

  final Function() selectMaleCard;
  final Function() selectFemaleCard;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: selectMaleCard,
            child: BMITile(
              tileColour: currentInputValueObject.selectedGender == Gender.male
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
            onTap: selectFemaleCard,
            child: BMITile(
              tileColour:
                  currentInputValueObject.selectedGender == Gender.female
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

/// 2) Card Widget to accept input AGE values.
class AgeSelectionCard extends StatelessWidget {
  const AgeSelectionCard({
    required this.updateAgeSliderValue,
    super.key,
  });

  final Function(double) updateAgeSliderValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kCardVerticalPadding,
        horizontal: kCardHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: kPrimaryWhite,
        borderRadius: kCardRoundness,
      ),
      child: Column(
        children: [
          Row(
            children: [
              kHorizontalGap8,
              Text(
                'Age',
                style: kCardHeadingTextStyle,
              ),
              const Spacer(),
              BMIInputMetricSelectorButton(
                inputButtonText: 'Years',
                buttonColour: kPrimaryBlue,
                buttonTextColour: kPrimaryWhite,
              ),
            ],
          ),
          BMISlider(
            sliderSIUnitLabel: 'Years',
            sliderValue: currentInputValueObject.ageSliderValue,
            sliderMinValue: kAgeSliderMinValue,
            sliderMaxValue: kAgeSliderMaxValue,
            updateSliderValue: updateAgeSliderValue,
          ),
          kVerticalGap8,
        ],
      ),
    );
  }
}

/// 3) Card Widget to accept input HEIGHT values.
class HeightSelectionCard extends StatefulWidget {
  const HeightSelectionCard({
    required this.updateFeetSliderValue,
    required this.updateInchSliderValue,
    required this.updateCmsSliderValue,
    super.key,
  });

  final Function(double) updateFeetSliderValue;
  final Function(double) updateInchSliderValue;
  final Function(double) updateCmsSliderValue;

  @override
  State<HeightSelectionCard> createState() => _HeightSelectionCardState();
}

class _HeightSelectionCardState extends State<HeightSelectionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kCardVerticalPadding,
        horizontal: kCardHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: kPrimaryWhite,
        borderRadius: kCardRoundness,
      ),
      child: Column(
        children: [
          Row(
            children: [
              kHorizontalGap8,
              Text(
                'Height',
                style: kCardHeadingTextStyle,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    inputHeightMetric = HeightMetric.feetinches;
                    currentInputValueObject.cmsSliderValue = 0;
                  });
                },
                child: BMIInputMetricSelectorButton(
                  inputButtonText: 'Feet',
                  buttonColour: inputHeightMetric == HeightMetric.feetinches
                      ? kPrimaryBlue
                      : kPrimaryWhite,
                  buttonTextColour: inputHeightMetric == HeightMetric.feetinches
                      ? kPrimaryWhite
                      : kPrimaryBlue,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    inputHeightMetric = HeightMetric.cms;
                    currentInputValueObject.feetSliderValue = 0;
                    currentInputValueObject.inchSliderValue = 0;
                  });
                },
                child: BMIInputMetricSelectorButton(
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
          inputHeightMetric == HeightMetric.feetinches
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    BMISlider(
                      sliderSIUnitLabel: 'Feet',
                      sliderValue: currentInputValueObject.feetSliderValue,
                      sliderMinValue: kFeetSliderMinValue,
                      sliderMaxValue: kFeetSliderMaxValue,
                      updateSliderValue: widget.updateFeetSliderValue,
                    ),
                    kVerticalGap4,
                    BMISlider(
                      sliderSIUnitLabel: 'Inches',
                      sliderValue: currentInputValueObject.inchSliderValue,
                      sliderMinValue: kInchSliderMinValue,
                      sliderMaxValue: kInchSliderMaxValue,
                      updateSliderValue: widget.updateInchSliderValue,
                    ),
                  ],
                )
              : BMISlider(
                  sliderSIUnitLabel: 'Cms',
                  sliderValue: currentInputValueObject.cmsSliderValue,
                  sliderMinValue: kCmsSliderMinValue,
                  sliderMaxValue: kCmsSliderMaxValue,
                  updateSliderValue: widget.updateCmsSliderValue,
                ),
          kVerticalGap8,
        ],
      ),
    );
  }
}

/// 4) Card Widget to accept input WEIGHT values.
class WeightSelectionCard extends StatefulWidget {
  const WeightSelectionCard({
    required this.updateKgsSliderValue,
    required this.updateLbsSliderValue,
    super.key,
  });

  final Function(double) updateKgsSliderValue;
  final Function(double) updateLbsSliderValue;

  @override
  State<WeightSelectionCard> createState() => _WeightSelectionCardState();
}

class _WeightSelectionCardState extends State<WeightSelectionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kCardVerticalPadding,
        horizontal: kCardHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: kPrimaryWhite,
        borderRadius: kCardRoundness,
      ),
      child: Column(
        children: [
          Row(
            children: [
              kHorizontalGap8,
              Text(
                'Weight',
                style: kCardHeadingTextStyle,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    inputWeightMetric = WeightMetric.kgs;
                    currentInputValueObject.lbsSliderValue = 0;
                  });
                },
                child: BMIInputMetricSelectorButton(
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
                    currentInputValueObject.kgsSliderValue = 0;
                  });
                },
                child: BMIInputMetricSelectorButton(
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
              ? BMISlider(
                  sliderSIUnitLabel: 'Kgs',
                  sliderValue: currentInputValueObject.kgsSliderValue,
                  sliderMinValue: kKgsSliderMinValue,
                  sliderMaxValue: kKgsSliderMaxValue,
                  updateSliderValue: widget.updateKgsSliderValue,
                )
              : BMISlider(
                  sliderSIUnitLabel: 'Lbs',
                  sliderValue: currentInputValueObject.lbsSliderValue,
                  sliderMinValue: kLbsSliderMinValue,
                  sliderMaxValue: kLbsSliderMaxValue,
                  updateSliderValue: widget.updateLbsSliderValue,
                ),
          kVerticalGap8,
        ],
      ),
    );
  }
}

/// 5) Row Widget to display RESET & CALCULATE Buttons.
class CalculateAndResetButtonsRow extends StatelessWidget {
  const CalculateAndResetButtonsRow({
    required this.resetSliderValues,
    required this.calculateResults,
    super.key,
  });

  final Function() resetSliderValues;
  final Function() calculateResults;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: BMIResetButton(
            resetSliderValues: resetSliderValues,
          ),
        ),
        kHorizontalGap8,
        Expanded(
          flex: 2,
          child: BMICalculateButton(
            calculateResults: calculateResults,
          ),
        ),
      ],
    );
  }
}
