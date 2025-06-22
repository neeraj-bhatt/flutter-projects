import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:expense_tracking/models/expense_model.dart';
import 'package:expense_tracking/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracking/widgets/new_expenses.dart';
import 'package:expense_tracking/widgets/chart/chart.dart';
import 'package:hive_flutter/adapters.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final expenseBox = Hive.box<Expense>('expenses_box');

  @override
  void dispose(){
    Hive.box('expenses_box').close();
    super.dispose();
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense newExpense) {
    expenseBox.add(newExpense);
  }

  // helper to find Hive key to expense Id
  dynamic _findExpenseKey(Expense expense) {
    return expenseBox.toMap().keys.firstWhere(
        (key) => expenseBox.get(key)?.id == expense.id,
        orElse: () => null);
  }

  void _removeExpense(Expense expense) async {
    final expenseKey = _findExpenseKey(expense);

    if (expenseKey != null) {
      // store expense copy before deletion
      final deletedExpense = expenseBox.get(expenseKey);

      // delete from hive
      await expenseBox.delete(expenseKey);

      ScaffoldMessenger.of(context)
          .clearSnackBars(); //clears the old SnackBars before new one comes up
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: const Text("Expense Deleted"),
          action: SnackBarAction(
              label: "Undo",
              onPressed: () async {
                if (deletedExpense != null) {
                  await expenseBox.put(expenseKey, deletedExpense);
                }
              }),
        ),
      );
    }
  }

  @override
  Widget build(context) {
    bool isPortrait =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracking App"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: expenseBox.listenable(),
        builder: (context, box, _) {
          List<Expense> expenses = expenseBox.values.toList();
          Widget mainContent = expenses.isEmpty
              ? const Center(child: Text("No Expense Found, Try to Add some"))
              : ExpensesList(
                  onRemoveExpense: _removeExpense, expenses: expenses);
          expenses = box.values.toList();
          return isPortrait
              ? Column(
                  children: [
                    Expanded(child: Chart(expenses: expenses)),
                    Expanded(
                      child: mainContent,
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: Chart(expenses: expenses)),
                    Expanded(
                      child: mainContent,
                    ),
                  ],
                );
        },
      ),
    );
  }
}
