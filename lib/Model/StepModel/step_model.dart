import 'package:flutter/material.dart';

class StepData {
  final String title;
  final bool isActive;
  final Widget widget;

  StepData({
    required this.title,
    required this.isActive,
    required this.widget,
  });
}