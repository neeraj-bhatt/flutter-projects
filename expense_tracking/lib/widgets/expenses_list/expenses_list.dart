import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:expense_tracking/models/expense_model.dart';
import 'package:expense_tracking/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.onRemoveExpense,
    required this.expenses,
  });

  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (cxt, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.75),
          margin: Theme.of(context).cardTheme.margin,
        ),
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        key: ValueKey(expenses[index].id),
        child: ExpensesItem(
          expenses[index],
        ),
      ),
    );
  }
}
