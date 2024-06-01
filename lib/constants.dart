import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///  1) List of Constant COLOUR VALUES used in the APP.
Color kPrimaryWhite = Colors.white;
Color kSecondaryWhite = const Color(0xc7ffffff);
Color kPrimaryBlue = const Color(0xff001894);
Color kSecondaryBlue = const Color(0xff000c42);

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
TextStyle kCardTitleTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: kCardTitleFontSize,
  fontWeight: FontWeight.w600,
);
TextStyle kLabelChipTextStyleWhite = GoogleFonts.robotoCondensed(
  color: kPrimaryWhite,
  fontSize: kCardSliderLabelTextFontSize,
  fontWeight: FontWeight.w600,
);
TextStyle kSliderLabelTextStyleBlue = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: kCardSliderLabelTextFontSize,
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

/// 5) List of Constant Values used for the GENDER TILE.
double kGenderTileHeightFactor = 0.22;
double kGenderTileTitleFontSize = 18;
BorderRadius kGenderTileCardRoundness = BorderRadius.circular(20);

/// 6) List of Constant Values used for the Card.
// Card Border Roundness values.
BorderRadius kCardRoundness = BorderRadius.circular(20);

// Card Padding size values.
double kCardVerticalPadding = 10;
double kCardHorizontalPadding = 10;

// Card Title size values.
double kCardTitleFontSize = 18;

// Input Metric Selector Button Size values.
BorderRadius kInputMetricSelectorButtonRoundness = BorderRadius.circular(14);

double kInputMetricSelectorButtonTextFontSize = 16;
double kCardInputMetricSelectorButtonHeightFactor = 0.038;
double kCardInputMetricSelectorButtonWidthFactor = 0.16;

// Slider Label Roundness.
BorderRadius kSliderLabelRoundness = BorderRadius.circular(14);

// Label Chips Outer Margin values.
double kLabelChipVerticalMargin = 0;
double kLabelChipHorizontalMargin = 4;

// Label Chips Inner Padding values.
double kLabelChipVerticalPadding = 6;
double kLabelChipHorizontalPadding = 12;

// Slider Label Size values.
double kCardSliderLabelTextFontSize = 14;

/// 7) List of Constant Values used for the AGE SELECTION Card.
// Age Slider Minimum & Maximum Values.
double kAgeSliderMinValue = 0;
double kAgeSliderMaxValue = 100;

/// 8) List of Constant Values used for the HEIGHT SELECTION Card.
// Height Slider Minimum & Maximum Values.
double kFeetSliderMinValue = 0;
double kFeetSliderMaxValue = 7;
double kInchSliderMinValue = 0;
double kInchSliderMaxValue = 11;
double kCmsSliderMinValue = 0;
double kCmsSliderMaxValue = 272;

/// 9) List of Constant Values used for the WEIGHT SELECTION Card.
// Weight Slider Minimum & Maximum Values.
double kKgsSliderMinValue = 0;
double kKgsSliderMaxValue = 160;
double kLbsSliderMinValue = 0;
double kLbsSliderMaxValue = 353;

/// 10) List of Constant values used for the CALCULATE BUTTON ROW.
// Constant Values used in Reset Button.
double kResetButtonHeight = 45;
double kResetButtonWidth = 130;
double kResetButtonIconSize = 30;
// Constant Values used in Calculate Button.
BorderRadius kResetButtonRoundness = BorderRadius.circular(18);
double kCalculateButtonHeight = 45;
BorderRadius kCalculateButtonRoundness = BorderRadius.circular(18);
