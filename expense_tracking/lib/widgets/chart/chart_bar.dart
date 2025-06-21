import 'package:expense_tracking/main.dart';

import 'package:flutter/material.dart';

import 'package:expense_tracking/models/expense_model.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
  });
  final double fill;

  @override
  Widget build(context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              color: isDark ? kDarkColorScheme.secondary : kColorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
