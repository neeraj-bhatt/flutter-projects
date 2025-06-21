import 'package:flutter/material.dart';

import 'package:expense_tracking/main.dart';
import 'package:expense_tracking/models/expense_model.dart';
import 'package:expense_tracking/widgets/chart/chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    List<ExpenseBucket> arr = [];
    for (final cat in Category.values) {
      arr.add(ExpenseBucket.ofCategory(expenses, cat));
    }
    return arr;
    //   HardCoded [
    //   ExpenseBucket.ofCategory(expenses, Category.work),
    //   ExpenseBucket.ofCategory(expenses, Category.leisure),
    //   ExpenseBucket.ofCategory(expenses, Category.food),
    //   ExpenseBucket.ofCategory(expenses, Category.travel),
    // ]
  }

  double get total {
    double total = 0;
    for (final bucket in buckets) {
      total += bucket.totalExpense;
    }
    return total;
  }

  @override
  Widget build(context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
        height: 300,
        width: double.infinity,
        margin: Theme.of(context).cardTheme.margin,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isDark
              ? kDarkColorScheme.secondary
              : kColorScheme.primary.withOpacity(0.50),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final bucket in buckets) //alternate to map
                    ChartBar(
                        fill: bucket.totalExpense == 0
                            ? 0
                            : bucket.totalExpense / total)
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: buckets
                  .map(
                    (bucket) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Icon(
                          categoryIcons[bucket.category],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ));
  }
}
