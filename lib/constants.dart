import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// 1) List of Constant COLOUR VALUES used in the APP.
Color kPrimaryWhite = const Color(0xdeffffff);
Color kSecondaryWhite = const Color(0x99ffffff);
Color kPrimaryBlue = const Color(0xff051052);
Color kSecondaryBlue = const Color(0xff000c42);

Color kBMIErrorColour = const Color(0xffde0707);

Color kBMIUnderweightColour = const Color(0xffe8e63c);
Color kBMINormalColour = const Color(0xff3ac91d);
Color kBMISlightlyOverWeightColour = const Color(0xffffaf2e);
Color kBMIOverWeightColour = const Color(0xff7b0025);

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
// Text Style used in the APP BAR Title.
TextStyle kAppBarTitleTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryWhite,
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

// Text Style used to display BMI Help Dialogue in Home screen.
TextStyle kBMIHelpInfoTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

// Text Style used in the GENDER TILE Title.
TextStyle kGenderTileTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: kGenderTileTitleFontSize,
  fontWeight: FontWeight.w800,
);

// Text Style used in the CARD Title.
TextStyle kCardHeadingTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: kCardTitleFontSize,
  fontWeight: FontWeight.w600,
);

// Text Style used in the Chip Text.
TextStyle kChipTextStyleWhite = GoogleFonts.robotoCondensed(
  color: kPrimaryWhite,
  fontSize: kLabelChipTextFontSize,
  fontWeight: FontWeight.w600,
);
TextStyle kChipTextStyleBlue = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: kLabelChipTextFontSize,
  fontWeight: FontWeight.w600,
);

// Text Style used in the RESET button.
TextStyle kResetButtonTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

// Text Style used in the Calculate button.
TextStyle kCalculateButtonTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

// Text Style used in the Alert Dialogue Box.
TextStyle kAlertDialogueHeadingTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: kAlertDialogueHeadingFontSize,
  fontWeight: FontWeight.w600,
);
TextStyle kAlertDialogueErrorTextStyle = GoogleFonts.robotoCondensed(
  color: kBMIErrorColour,
  fontSize: kAlertDialogueErrorFontSize,
  fontWeight: FontWeight.w600,
);

// Text Style used in the BMI Range Display Alert Dialogue Box.
TextStyle kBMIResultRangeTextStyledEnabled = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);
TextStyle kBMIResultRangeTextStyledDisabled = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: 15,
  fontWeight: FontWeight.w500,
);

// Text Style used in the BMI Result Label display.
TextStyle kBMIResultLabelTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryWhite,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

// Text Style used to display BMI Inference Information.
TextStyle kBMIInferenceSheetBodyTextStyle = GoogleFonts.robotoCondensed(
  color: kPrimaryBlue,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

/// 4) List of Constant Values used in the APP BAR.
// AppBar Padding values.
const double kAppBarVerticalPadding = 10;
const double kAppBarHorizontalPadding = 0;

// AppBar Icon Size values.
const double kAppBarIconSize = 35;
const double kAppBarHelpIconSize = 24;

/// 5) List of Constant Values used in the GENDER TILE.
// Gender Tile Widget's Height Factor
const double kGenderTileHeightFactor = 0.22;

// Gender Tile Widget's Title Font Size value.
const double kGenderTileTitleFontSize = 18;

// Gender Tile Widget's Card Roundness value.
BorderRadius kGenderTileCardRoundness = BorderRadius.circular(20);

/// 6) List of Constant Values used in the CARD WIDGET.
// Card Widget's Border Roundness value.
BorderRadius kCardRoundness = BorderRadius.circular(20);

// Card Widget's Vertical & Horizontal Padding values.
const double kCardVerticalPadding = 10;
const double kCardHorizontalPadding = 10;

// Card Widget's Header Vertical & Horizontal Padding values.
const double kCardHeaderVerticalPadding = 6;
const double kCardHeaderHorizontalPadding = 5;

// Card Widget's Card Title Font Size values.
const double kCardTitleFontSize = 20;

// Card Widget's Input Metric Selector Button Size Roundness value.
BorderRadius kInputMetricSelectorButtonRoundness = BorderRadius.circular(16);

// Card Widget's Input Metric Selector Button Vertical & Horizontal Padding values.
const double kInputMetricSelectorButtonVerticalPadding = 4;
const double kInputMetricSelectorButtonHorizontalPadding = 12;

// Card Widget's Input Metric Selector Button Text Font Size value.
const double kInputMetricSelectorButtonTextFontSize = 16;

// Card Widget's Value Label Chip Roundness.
BorderRadius kValueLabelChipRoundness = BorderRadius.circular(16);

// Card Widget's Value Label Chip Outer Margin values.
const double kLabelChipVerticalMargin = 0;
const double kLabelChipHorizontalMargin = 4;

// Card Widget's Value Label Chip Inner Padding values.
const double kLabelChipVerticalPadding = 6;
const double kLabelChipHorizontalPadding = 12;

// Card Widget's Value Label Chip Text Font Size values.
const double kLabelChipTextFontSize = 14;

/// 7) List of Constant Values used in the AGE,HEIGHT & WEIGHT SELECTION CARD.
// Age (Years) Slider Minimum & Maximum Values.
const double kAgeSliderMinValue = 0;
const double kAgeSliderMaxValue = 100;

/// 8) List of Constant Values used in the HEIGHT SELECTION Card.
// Height (Feet) Slider Minimum & Maximum values.
const double kFeetSliderMinValue = 0;
const double kFeetSliderMaxValue = 9;

// Height (Inches) Slider Minimum & Maximum values.
const double kInchSliderMinValue = 0;
const double kInchSliderMaxValue = 11;

// Height (Centimeters) Slider Minimum & Maximum values.
const double kCmsSliderMinValue = 0;
const double kCmsSliderMaxValue = 272;

/// 9) List of Constant Values used in the WEIGHT SELECTION Card.
// Weight (Kilograms) Slider Minimum & Maximum values.
const double kKgsSliderMinValue = 0;
const double kKgsSliderMaxValue = 190;

// Weight (Pounds) Slider Minimum & Maximum values.
const double kLbsSliderMinValue = 0;
const double kLbsSliderMaxValue = 250;

/// 10) List of Constant values used in the CALCULATE BUTTON ROW.
// Reset Button's Roundness values.
BorderRadius kResetButtonRoundness = BorderRadius.circular(22);

// Reset Button's Height & Width values.
const double kResetButtonHeight = 45;
const double kResetButtonWidth = 130;

// Reset Button's Icon Size values.
const double kResetButtonIconSize = 30;

// Calculate Button's Roundness values.
BorderRadius kCalculateButtonRoundness = BorderRadius.circular(22);

// Calculate Button's Height & Width values.
const double kCalculateButtonHeight = 45;
const double kCalculateButtonWidth = 45;

/// 11) List of Constant values used in the ALERT DIALOGUE box.
// Alert Dialogue Card's Vertical & Horizontal Padding values.
const double kAlertDialogueCardVerticalPadding = 20;
const double kAlertDialogueCardHorizontalPadding = 16;

// Alert Dialogue Card's Roundness.
BorderRadius kAlertDialogueRoundness = BorderRadius.circular(22);

// Alert Dialogue Card's Heading Font Size.
const double kAlertDialogueHeadingFontSize = 18;

// Alert Dialogue Card's Error Text Font Size.
const double kAlertDialogueErrorFontSize = 14;

// Alert Dialogue Card's Call-to-Action Button Vertical & Horizontal Padding values.
const double kAlertDialogueOkButtonVerticalPadding = 10;
const double kAlertDialogueOkButtonHorizontalPadding = 50;

/// 12) List of Constant values used in the inference of BMI Results.
// BMI Underweight, Normal ,Overweight Range values.
const double kBMIUnderWeightLimit = 18.4;
const double kBMINormalLimit = 24.9;
const double kBMISlightlyOverWeightLimit = 39.9;
const double kBMIOverWeightLimit = 60;

/// 13) List of Constant values used in the BMI Result Label.
// BMI Result Label Widget's Border Roundness values.
BorderRadius kBMIResultLabelRoundness = BorderRadius.circular(22);

// BMI Result Label Widget's Vertical & Horizontal Padding values.
const double kBMIResultLabelVerticalPadding = 4;
const double kBMIResultLabelHorizontalPadding = 16;

/// 14) List of constant used in Results Range Display Widget (Results Help)
// Results Range Display Widgets Vertical & Horizontal Padding values.
const double kResultsRangeDisplayVerticalPadding = 5;
const double kResultsRangeDisplayHorizontalPadding = 5;

/// 15) List of constant Text values used to display information.
// Help Text used to display the meaning of BMI in the Help Dialogue box in the Home screen.
const String kBMIHelpText =
    'Body mass index (BMI) is a person’s weight in kilograms divided by the square of height in meters. BMI is an inexpensive and easy screening method for weight category—underweight, healthy weight, overweight, and obesity.\n\nBMI does not measure body fat directly, but BMI is moderately correlated with more direct measures of body fat 1,2,3. Furthermore, BMI appears to be as strongly correlated with various metabolic and disease outcome as are these more direct measures of body fatness';

// BMI Formula Text.
const String kBMIFormulaText = 'BMI = W/H^2';

// BMI Formula Inference Text.
const String kBMIFormulaInference = 'W = Weight in KG.\nH = Height in Meters.';

// Help Texts used to display the Information related to the BMI Result.
const String kBMIUnderweightInformationText =
    'Being underweight means that your weight is below the healthy weight range — the weight that research has shown you need to be for your body is to work properly. Being underweight can lead to many different health problems. \n \nThere are many causes of being underweight, including physical and mental health problems and not having good access to food. A good way to know if you are underweight is to check your body mass index (BMI). \n \nIf you are underweight, it is important you eat foods with enough energy to gain weight, protein to repair your body and build your muscles, and vitamins and minerals to make you healthy.';
const String kBMINormalInformationText =
    'A Body Mass Index (BMI) in the normal range, which is between 18.5 and 24.9, indicates that an individual\'s weight is proportionate to their height and falls within the parameters considered healthy by medical standards. This range is associated with a lower risk of chronic diseases such as heart disease, diabetes, and hypertension, compared to those with BMI values outside this range. \n\nIn addition to physical health benefits, having a BMI in the normal range can positively influence mental and emotional well-being. People who fall within this range often experience higher self-esteem and body image satisfaction. They may also be less likely to suffer from the social stigma and discrimination that can accompany being underweight or overweight. This can lead to a more positive outlook on life and better social interactions, contributing to overall mental health.';
const String kBMISlightlyOverweightInformationText =
    'Being slightly overweight can be a precursor to various health risks, such as cardiovascular diseases, type 2 diabetes, and hypertension. While the risk is not as high as in the obese category, it is still elevated compared to those with a normal BMI. \n\nBMI does not differentiate between muscle and fat. Therefore, some individuals, such as athletes or those with high muscle mass, may have a BMI in the overweight range but not have excess body fat. Conversely, individuals with lower muscle mass might carry more body fat, even if their BMI is slightly overweight.';
const String kBMIOverweightInformationText =
    'Obesity means weighing more than what is healthy for a given height. Obesity is a serious, chronic disease. It can lead to other health problems, including diabetes, heart disease, and some cancers. \n\n If you have obesity and would like to lose weight but have been unable to do so on your own, medical help is available. Start with a primary care physician, who may be able to refer you to a weight specialist in your area.';

// Help Texts used to display some Tips related to the BMI Result.
const String kBMIUnderweightTipsText =
    '1. Eating more frequently. Slowly begin to eat 5 to 6 smaller meals during the day. \n\n2. Choosing food with lots of nutrients. Set up a routine to eat and drink things you like and that have a lot of nutrients as well as calories. \n\n3. Top it off. Add extras to your dishes for more calories, such as cheese in casseroles or nut butter on whole-grain toast.\n\n4. Try smoothies and shakes. Avoid beverages with few nutrients or calories, such as diet soda. But a blend of high-calorie, nutritious ingredients in a smoothie or shake can help if you\'re eating on the go.\n\n5. Watch what and when you drink. Beverages can make you feel full. If that\'s the case for you, avoid drinking during a meal or before. But make sure you are drinking enough throughout the day. \n\n6. Exercise, especially strength training, can help you gain weight by building up your muscles. Exercise also may stimulate your appetite.';
const String kBMINormalTipsText =
    '1. Eat a variety of foods to ensure you get all necessary nutrients. Focus on fruits, vegetables, whole grains, lean proteins, and healthy fats. Limit the intake of processed foods, sugary drinks, and excessive amounts of saturated and trans fats.\n\n2. Aim for at least 150 minutes of moderate-intensity aerobic activity or 75 minutes of vigorous-intensity activity each week, combined with muscle-strengthening exercises on two or more days a week. Activities like walking, cycling, swimming, and strength training are excellent choices.\n\n3. Ensure you get 7-9 hours of quality sleep each night. Good sleep is crucial for physical and mental health, helping to repair and rejuvenate the body, improve mood, and maintain cognitive function.\n\n4. Drink plenty of water throughout the day to stay hydrated. Water is essential for digestion, nutrient absorption, and overall bodily functions. Limit sugary drinks and excessive caffeine intake.';
const String kBMISlightlyOverweightTipsText =
    '1. Include a variety of foods in your diet to ensure you get all essential nutrients. Focus on fruits, vegetables, whole grains, lean proteins, and healthy fats. Avoid excessive intake of processed foods, sugary drinks, and high amounts of saturated and trans fats.\n\n2. Engage in regular physical activity to improve overall health and maintain a healthy weight. Aim for at least 150 minutes of moderate-intensity aerobic activity, such as brisk walking or cycling, or 75 minutes of vigorous-intensity activity, like running or swimming, each week. Include muscle-strengthening activities at least two days a week.\n\n3. Drink plenty of water throughout the day to stay hydrated. Water is crucial for digestion, nutrient absorption, and maintaining bodily functions. Limit the intake of sugary beverages and excessive caffeine, opting instead for water, herbal teas, and natural fruit juices.\n\n4. Practice stress management techniques such as mindfulness, meditation, deep breathing exercises, or yoga. Regular physical activity and maintaining social connections can also help manage stress';
const String kBMIOverweightTipsText =
    '1. Do not skip meals. Start the day with a healthy breakfast. Eating 3 meals per day helps your body have energy it needs and it prevents hunger.\n\n2. Control your portion size. Use a standard 9 inch plate, avoid bigger plate sizes.Eat when hungry. Avoid eating to relax, or because you are bored or depressed.\n\n3. Take a walk or do something you enjoy instead. Download the Croí food diary and fill it in for a few days. \n\n4. Limit sugar and sweets. Desserts have many calories and few nutrients.\n\n5. Drink plenty of water. Aim for a minimum of 6-8 glasses (2 litres) of water each day.\n\n6. Choose healthy snacks. Enjoy fresh fruit, vegetables, or low fat yogurt instead of packaged snacks';
