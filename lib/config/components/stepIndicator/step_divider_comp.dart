import 'package:flutter/material.dart';

class StepDividerComp extends StatelessWidget {
  const StepDividerComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.grey[300],
    );
  }
}
