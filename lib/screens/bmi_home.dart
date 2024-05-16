import 'package:bmi_calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiHome extends StatefulWidget {
  const BmiHome({super.key});

  @override
  State<BmiHome> createState() => _BmiHomeState();
}

class _BmiHomeState extends State<BmiHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calculate,
                color: Colors.white,
                size: 45,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'BMI Calculator',
                style: GoogleFonts.robotoCondensed(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(
                width: 6,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: GenderTile(
                  gender: 'male',
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: GenderTile(
                  gender: 'female',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
