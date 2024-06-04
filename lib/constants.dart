import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///  1) List of Constant COLOUR VALUES used in the APP.
Color kPrimaryWhite = Colors.white;
Color kSecondaryWhite = const Color(0xc7ffffff);
Color kPrimaryBlue = const Color(0xff001894);
Color kSecondaryBlue = const Color(0xff000c42);
Color kBMIUnderweightColour = const Color(0xffffaf2e);
Color kBMINormalColour = const Color(0xff3ac91d);
Color kBMIOverWeightColour = const Color(0xff980000);

/// 2) GAP Constants used throughout the APP.
SizedBox kVerticalGap4 = const SizedBox(
  height: 4,
);
SizedBox kHorizontalGap4 = const SizedBox(
  width: 4,
);

SizedBox kVerticalGap8 = const SizedBox(
  height: 8,
);
SizedBox kHorizontalGap8 = const SizedBox(
  width: 8,
);

SizedBox kVerticalGap10 = const SizedBox(
  height: 10,
);
SizedBox kHorizontalGap10 = const SizedBox(
  width: 10,
);

/// 3) List of TEXT STYLES used throughout the APP.
TextStyle kAppBarTitleTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryWhite,
  fontSize: 24,
  fontWeight: FontWeight.w600,
);
TextStyle kCardHeadingTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: kCardTitleFontSize,
  fontWeight: FontWeight.w600,
);
TextStyle kLabelChipTextStyleWhite = GoogleFonts.robotoCondensed(
  color: kPrimaryWhite,
  fontSize: kLabelChipTextFontSize,
  fontWeight: FontWeight.w600,
);
TextStyle kSliderLabelTextStyleBlue = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: kLabelChipTextFontSize,
  fontWeight: FontWeight.w600,
);
TextStyle kResetButtonTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);
TextStyle kCalculateButtonTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

/// 4) List of Constant Values used in the APP BAR.
double kAppBarIconSize = 35;
double kAppBarHelpIconSize = 24;

/// 5) List of Constant Values used in the GENDER TILE.
double kGenderTileHeightFactor = 0.22;
double kGenderTileTitleFontSize = 18;
BorderRadius kGenderTileCardRoundness = BorderRadius.circular(20);

/// 6) List of Constant Values used in the CARD WIDGET.
// Card Widget's Border Roundness value.
BorderRadius kCardRoundness = BorderRadius.circular(20);
// Card Widget's Vertical & Horizontal Padding values.
double kCardVerticalPadding = 10;
double kCardHorizontalPadding = 10;
// Card Widget's Card Title Font Size values.
double kCardTitleFontSize = 18;
// Card Widget's Input Metric Selector Button Size Roundness value.
BorderRadius kInputMetricSelectorButtonRoundness = BorderRadius.circular(16);
// Card Widget's Input Metric Selector Button Vertical & Horizontal Padding values.
double kInputMetricSelectorButtonVerticalPadding = 4;
double kInputMetricSelectorButtonHorizontalPadding = 12;
// Card Widget's Input Metric Selector Button Text Font Size value.
double kInputMetricSelectorButtonTextFontSize = 16;
// Card Widget's Value Label Chip Roundness.
BorderRadius kValueLabelChipRoundness = BorderRadius.circular(16);
// Card Widget's Value Label Chip Outer Margin values.
double kLabelChipVerticalMargin = 0;
double kLabelChipHorizontalMargin = 4;
// Card Widget's Value Label Chip Inner Padding values.
double kLabelChipVerticalPadding = 6;
double kLabelChipHorizontalPadding = 12;
// Card Widget's Value Label Chip Text Font Size values.
double kLabelChipTextFontSize = 14;

/// 7) List of Constant Values used in the AGE,HEIGHT & WEIGHT SELECTION CARD.
// Age (Years) Slider Minimum & Maximum Values.
double kAgeSliderMinValue = 0;
double kAgeSliderMaxValue = 100;

/// 8) List of Constant Values used in the HEIGHT SELECTION Card.
// Height (Feet) Slider Minimum & Maximum Values.
double kFeetSliderMinValue = 0;
double kFeetSliderMaxValue = 9;
// Height (Inches) Slider Minimum & Maximum Values.
double kInchSliderMinValue = 0;
double kInchSliderMaxValue = 11;
// Height (Centimeters) Slider Minimum & Maximum Values.
double kCmsSliderMinValue = 0;
double kCmsSliderMaxValue = 272;

/// 9) List of Constant Values used in the WEIGHT SELECTION Card.
// Weight (Kilograms) Slider Minimum & Maximum Values.
double kKgsSliderMinValue = 0;
double kKgsSliderMaxValue = 160;
// Weight (Pounds) Slider Minimum & Maximum Values.
double kLbsSliderMinValue = 0;
double kLbsSliderMaxValue = 353;

/// 10) List of Constant values used in the CALCULATE BUTTON ROW.
// Reset Button's Roundness values.
BorderRadius kResetButtonRoundness = BorderRadius.circular(22);
// Reset Button's Height & Width values.
double kResetButtonHeight = 45;
double kResetButtonWidth = 130;
// Reset Button's Icon Size values.
double kResetButtonIconSize = 30;
// Calculate Button's Roundness values.
BorderRadius kCalculateButtonRoundness = BorderRadius.circular(22);
// Calculate Button's Height & Width values.
double kCalculateButtonHeight = 45;
double kCalculateButtonWidth = 45;

/// 11) List of Constant values used in the BMI Result Label.
// BMI Result Label Widget's Border Roundness values.
BorderRadius kBMIResultLabelRoundness = BorderRadius.circular(22);
// BMI Result Label Widget's Vertical & Horizontal Padding values.
double kBMIResultLabelVerticalPadding = 4;
double kBMIResultLabelHorizontalPadding = 16;

/// 12) List of Constant values used in the inference of BMI Results.
// BMI Underweight, Normal ,Overweight Range values.
double kBMIUnderWeightLimit = 18.4;
double kBMINormalLimit = 24.9;
double kBMIOverWeightLimit = 50;
