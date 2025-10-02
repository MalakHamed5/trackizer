import 'package:flutter/widgets.dart';

class BudgetModel {
  final String title;
  final String img;
  final double spent;
  final double total;
  final Color color;

  BudgetModel(
    {
    required this.title,
    required this.img,
    required this.spent,
    required this.total,
    required this.color,
  });

  double get remaining => total - spent;
  double get progress => (spent / total).clamp(0.0, 1.0);
}
