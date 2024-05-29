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
TextStyle kSliderLabelTextStyleWhite = GoogleFonts.robotoCondensed(
  color: kPrimaryWhite,
  fontSize: kCardSliderTextFontSize,
  fontWeight: FontWeight.w600,
);
TextStyle kSliderLabelTextStyleBlue = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: kCardSliderTextFontSize,
  fontWeight: FontWeight.w600,
);
TextStyle kResetButtonTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: 22,
  fontWeight: FontWeight.w600,
);
TextStyle kCalculateButtonTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: 22,
  fontWeight: FontWeight.w600,
);

/// 4) List of Constant Values used in the APP BAR.
double kAppBarIconSize = 45;
double kAppBarHelpIconSize = 24;

/// 5) List of Constant Values used for the GENDER TILE.
double kGenderTileHeight = 200;
double kGenderTileTitleFontSize = 18;
BorderRadius kGenderTileCardRoundness = BorderRadius.circular(16);

/// 6) List of Constant Values used for the Card.
double kCardTitleFontSize = 18;
double kInputMetricSelectorButtonTextFontSize = 16;
double kCardSliderTextFontSize = 14;
double kCardInputSelectorButtonHeight = 34;
double kCardInputSelectorButtonWidth = 60;

/// 7) List of Constant Values used for the HEIGHT SELECTION Card.
// Height Card Border Roundness.
BorderRadius kHeightSelectionCardRoundness = BorderRadius.circular(16);
// Height Card Inside Padding values.
double kHeightSelectionCardVerticalPadding = 20;
double kHeightSelectionCardHorizontalPadding = 15;
// Height Card Slider Label Button Size values.
double kHeightSliderValueLabelHeight = 34;
double kHeightSliderValueLabelWidth = 80;
BorderRadius kHeightSliderValueLabelRoundness = BorderRadius.circular(17);
// Height Slider Minimum & Maximum Values.
double kFeetSliderMinValue = 0;
double kFeetSliderMaxValue = 7;
double kInchSliderMinValue = 0;
double kInchSliderMaxValue = 11;
double kCmsSliderMinValue = 0;
double kCmsSliderMaxValue = 272;

/// 8) List of Constant Values used for the WEIGHT SELECTION Card.
// Weight Card Border Roundness.
BorderRadius kWeightSelectionCardRoundness = BorderRadius.circular(16);
// Weight Card Inside Padding values.
double kWeightSelectionCardVerticalPadding = 20;
double kWeightSelectionCardHorizontalPadding = 15;
// Weight Card Slider Label Button Size values.
double kWeightSliderValueLabelHeight = 34;
double kWeightSliderValueLabelWidth = 80;
BorderRadius kWeightSliderValueLabelRoundness = BorderRadius.circular(17);
// Weight Slider Minimum & Maximum Values.
double kKgsSliderMinValue = 0;
double kKgsSliderMaxValue = 160;
double kLbsSliderMinValue = 0;
double kLbsSliderMaxValue = 353;

/// 9) List of Constant Values used for the AGE SELECTION Card.
// Age Card Border Roundness.
BorderRadius kAgeSelectionCardRoundness = BorderRadius.circular(16);
// Age Card Inside Padding values.
double kAgeSelectionCardVerticalPadding = 20;
double kAgeSelectionCardHorizontalPadding = 15;
// Age Card Slider Label Button Size values.
double kAgeSliderValueLabelHeight = 34;
double kAgeSliderValueLabelWidth = 80;
BorderRadius kAgeSliderValueLabelRoundness = BorderRadius.circular(17);
// Age Slider Minimum & Maximum Values.
double kAgeSliderMinValue = 0;
double kAgeSliderMaxValue = 100;

/// 10) List of Constant values used for the CALCULATE BUTTON ROW.
// Constant Values used in Reset Button.
double kResetButtonHeight = 60;
double kResetButtonWidth = 130;
double kResetButtonIconSize = 30;
// Constant Values used in Calculate Button.
BorderRadius kResetButtonRoundness = BorderRadius.circular(30);
double kCalculateButtonHeight = 60;
BorderRadius kCalculateButtonRoundness = BorderRadius.circular(40);
