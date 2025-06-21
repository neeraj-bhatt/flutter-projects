import 'package:flutter/material.dart';

import 'package:expense_tracking/models/expense_model.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expenseItem, {super.key});

  final Expense expenseItem;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expenseItem.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text("\$${expenseItem.amount.toStringAsFixed(2)}"),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expenseItem.category]),
                    const SizedBox(width: 8),
                    Text(expenseItem.formattedDate),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
