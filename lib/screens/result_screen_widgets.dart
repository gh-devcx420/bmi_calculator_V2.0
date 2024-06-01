import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/enums.dart';
import 'package:bmi_calculator/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatefulWidget {
  const ResultCard({
    super.key,
  });

  @override
  State<ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              kHorizontalGap10,
              Text(
                'Your BMI Results',
                style: kCardTitleTextStyle,
              ),
            ],
          ),
          kVerticalGap8,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TextLabelChip(
                  labelChipSIText:
                      currentInputValues.selectedGender == Gender.male
                          ? 'Male'
                          : currentInputValues.selectedGender == Gender.female
                              ? 'Female'
                              : 'None',
                ),
                ValueLabelChip(
                  labelChipValue: currentInputValues.ageSliderValue,
                  labelChipText: 'Years',
                ),
                if (inputHeightMetric == HeightMetric.feet)
                  ValueLabelChip(
                    labelChipValue: currentInputValues.feetSliderValue,
                    labelChipText: 'Feet',
                  ),
                if (inputHeightMetric == HeightMetric.feet)
                  ValueLabelChip(
                    labelChipValue: currentInputValues.inchSliderValue,
                    labelChipText: 'Inches',
                  ),
                if (inputHeightMetric == HeightMetric.cms)
                  ValueLabelChip(
                    labelChipValue: currentInputValues.cmsSliderValue,
                    labelChipText: 'Cms',
                  ),
                if (inputWeightMetric == WeightMetric.kgs)
                  ValueLabelChip(
                    labelChipValue: currentInputValues.kgsSliderValue,
                    labelChipText: 'Kgs',
                  ),
                if (inputWeightMetric == WeightMetric.pounds)
                  ValueLabelChip(
                    labelChipValue: currentInputValues.lbsSliderValue,
                    labelChipText: 'Lbs',
                  ),
              ],
            ),
          ),
          kVerticalGap10,
        ],
      ),
    );
  }
}
