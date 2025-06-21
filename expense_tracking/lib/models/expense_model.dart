import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';

part 'expense_model.g.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

@HiveType(typeId: 1)
enum Category {
  @HiveField(0)
  travel,
  @HiveField(1)
  food,
  @HiveField(2)
  leisure,
  @HiveField(3)
  work
}

const categoryIcons = {
  Category.travel: Icons.flight_takeoff,
  Category.food: Icons.fastfood,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

@HiveType(typeId: 0)
class Expense {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.ofCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpense {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
