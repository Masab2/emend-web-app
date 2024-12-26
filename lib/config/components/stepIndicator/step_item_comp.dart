import 'package:flutter/material.dart';

class StepItemComp extends StatelessWidget {
  final int step;
  final String title;
  final bool active;
  const StepItemComp({super.key, required this.step, required this.title, required this.active});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: active ? Colors.black : Colors.grey[300],
          child: Text(
            '${step + 1}',
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            color: active ? Colors.black : Colors.grey,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}