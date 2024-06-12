import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/enums.dart';
import 'package:bmi_calculator/screens/bmi_home.dart';
import 'package:bmi_calculator/widgets/basic_widgets.dart';
import 'package:bmi_calculator/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      padding: const EdgeInsets.symmetric(
        vertical: kCardVerticalPadding,
        horizontal: kCardHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: kPrimaryWhite,
        borderRadius: kCardRoundness,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: kCardHeaderHorizontalPadding,
              vertical: kCardHeaderVerticalPadding,
            ),
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.cakeCandles,
                  size: 16,
                ),
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
          ),
          BMISlider(
            sliderSIUnitLabel: 'Years',
            sliderValue: currentInputValueObject.ageSliderValue,
            sliderMinValue: kAgeSliderMinValue,
            sliderMaxValue: kAgeSliderMaxValue,
            updateSliderValue: updateAgeSliderValue,
          ),
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
  void _updateHeightMetric(HeightMetric metric) {
    setState(() {
      if (metric == HeightMetric.feetinches) {
        currentHeightMetric = HeightMetric.feetinches;
        currentInputValueObject.cmsSliderValue = 0;
      } else if (metric == HeightMetric.cms) {
        currentHeightMetric = HeightMetric.cms;
        currentInputValueObject.feetSliderValue = 0;
        currentInputValueObject.inchSliderValue = 0;
      }
    });
  }

  Widget _buildHeightInputMetricSelectorButton(
      String buttonText, HeightMetric metric) {
    bool isSelected = currentHeightMetric == metric;
    return GestureDetector(
      onTap: () => _updateHeightMetric(metric),
      child: BMIInputMetricSelectorButton(
        inputButtonText: buttonText,
        buttonColour: isSelected ? kPrimaryBlue : kPrimaryWhite,
        buttonTextColour: isSelected ? kPrimaryWhite : kPrimaryBlue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kCardVerticalPadding,
        horizontal: kCardHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: kPrimaryWhite,
        borderRadius: kCardRoundness,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: kCardHeaderHorizontalPadding,
              vertical: kCardHeaderVerticalPadding,
            ),
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.upDown,
                  size: 18,
                ),
                kHorizontalGap4,
                Text(
                  'Height',
                  style: kCardHeadingTextStyle,
                ),
                const Spacer(),
                _buildHeightInputMetricSelectorButton(
                  'Feet',
                  HeightMetric.feetinches,
                ),
                _buildHeightInputMetricSelectorButton(
                  'Cms',
                  HeightMetric.cms,
                ),
              ],
            ),
          ),
          currentHeightMetric == HeightMetric.feetinches
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
  Widget _buildWeightInputMetricSelectorButton(
      String buttonText, WeightMetric metric) {
    bool isSelected = currentWeightMetric == metric;
    return GestureDetector(
      onTap: () => updateWeight(metric),
      child: BMIInputMetricSelectorButton(
        inputButtonText: buttonText,
        buttonColour: isSelected ? kPrimaryBlue : kPrimaryWhite,
        buttonTextColour: isSelected ? kPrimaryWhite : kPrimaryBlue,
      ),
    );
  }

  void updateWeight(WeightMetric metric) {
    setState(() {
      if (metric == WeightMetric.kgs) {
        currentWeightMetric = WeightMetric.kgs;
        currentInputValueObject.lbsSliderValue = 0;
      } else if (metric == WeightMetric.pounds) {
        currentWeightMetric = WeightMetric.pounds;
        currentInputValueObject.kgsSliderValue = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kCardVerticalPadding,
        horizontal: kCardHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: kPrimaryWhite,
        borderRadius: kCardRoundness,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: kCardHeaderHorizontalPadding,
              vertical: kCardHeaderVerticalPadding,
            ),
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.weightScale,
                  size: 18,
                ),
                kHorizontalGap8,
                Text(
                  'Weight',
                  style: kCardHeadingTextStyle,
                ),
                const Spacer(),
                _buildWeightInputMetricSelectorButton(
                  'Kgs',
                  WeightMetric.kgs,
                ),
                _buildWeightInputMetricSelectorButton(
                  'Lbs',
                  WeightMetric.pounds,
                ),
              ],
            ),
          ),
          currentWeightMetric == WeightMetric.kgs
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
