import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widgets/common_widgets.dart';
import 'package:bmi_calculator/widgets/result_screen_widgets.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BMIBackgroundGradientContainer(
        currentScreen: SafeArea(
          child: Column(
            children: [
              const BMIAppBar(
                leadingIcon: Icons.bar_chart,
                appBarLabel: 'Results',
                actionsIcon: null,
              ),
              kVerticalGap8,
              const ResultCard(),
            ],
          ),
        ),
      ),
    );
  }
}
