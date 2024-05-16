import 'package:flutter/material.dart';

class GenderTile extends StatelessWidget {
  const GenderTile({super.key, required this.gender});

  final String gender;

  @override
  Widget build(BuildContext context) {
    //double h = MediaQuery.of(context).size.height;
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xc7ffffff),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon depends on Gender.
          gender == 'male'
              ? const Icon(
                  Icons.male,
                  size: 80,
                  color: Color(0xff001894),
                )
              : const Icon(
                  Icons.female,
                  size: 80,
                  color: Color(0xff001894),
                ),
          const SizedBox(
            height: 8,
          ),
          // Tile Text depends on Gender.
          gender == 'male'
              ? const Text(
                  'Male ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : const Text(
                  'Female',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ],
      ),
    );
  }
}
