import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/enums.dart';
import 'package:bmi_calculator/screens/bmi_home.dart';
import 'package:bmi_calculator/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              kHorizontalGap8,
              Text(
                'BMI Inference Sheet',
                style: kCardHeadingTextStyle,
              ),
            ],
          ),
          kVerticalGap8,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TextLabel(
                  labelChipSIText: currentInputValueObject.selectedGender ==
                          Gender.male
                      ? 'Male'
                      : currentInputValueObject.selectedGender == Gender.female
                          ? 'Female'
                          : 'None',
                ),
                ValueTextLabel(
                  valueLabelChipValue: currentInputValueObject.ageSliderValue,
                  valueLabelChipText: 'Years',
                ),
                if (inputHeightMetric == HeightMetric.feet)
                  ValueTextLabel(
                    valueLabelChipValue:
                        currentInputValueObject.feetSliderValue,
                    valueLabelChipText: 'Feet',
                  ),
                if (inputHeightMetric == HeightMetric.feet)
                  ValueTextLabel(
                    valueLabelChipValue:
                        currentInputValueObject.inchSliderValue,
                    valueLabelChipText: 'Inches',
                  ),
                if (inputHeightMetric == HeightMetric.cms)
                  ValueTextLabel(
                    valueLabelChipValue: currentInputValueObject.cmsSliderValue,
                    valueLabelChipText: 'Cms',
                  ),
                if (inputWeightMetric == WeightMetric.kgs)
                  ValueTextLabel(
                    valueLabelChipValue: currentInputValueObject.kgsSliderValue,
                    valueLabelChipText: 'Kgs',
                  ),
                if (inputWeightMetric == WeightMetric.pounds)
                  ValueTextLabel(
                    valueLabelChipValue: currentInputValueObject.lbsSliderValue,
                    valueLabelChipText: 'Lbs',
                  ),
              ],
            ),
          ),
          kVerticalGap8,
          Divider(
            thickness: 2.2,
            color: kPrimaryBlue,
          ),
          kVerticalGap8,
          Row(
            children: [
              kHorizontalGap8,
              Text(
                'Your result is :',
                style: kCardHeadingTextStyle,
              ),
              kHorizontalGap8,
              Text(
                currentInputValueObject.bmiResultInference,
                style: GoogleFonts.robotoCondensed(
                  color: currentInputValueObject.bmiResultColour,
                  fontSize: kCardTitleFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.help,
                color: kPrimaryBlue,
              ),
              kHorizontalGap8
            ],
          ),
          kVerticalGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BMIResultLabel(),
              kHorizontalGap8,
              const Expanded(
                child: BMIResultGauge(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
