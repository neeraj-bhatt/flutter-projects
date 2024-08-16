import 'package:flutter/material.dart';

import 'package:expense_tracking/models/expense_data_model.dart';
import 'package:expense_tracking/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (cxt, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: Theme.of(context).cardTheme.margin,
        ),
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        key: ValueKey(expenses[index]),
        child: ExpensesItem(
          expenses[index],
        ),
      ),
    );
  }
}
