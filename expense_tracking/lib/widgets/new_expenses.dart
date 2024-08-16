import 'package:flutter/material.dart';
import 'package:expense_tracking/models/expense_data_model.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<AddExpense> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpense> {
  String _titleValue = "";
  String _amountValue = "";
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _saveTitleInput(String inputValue) {
    _titleValue = inputValue;
  }

  void _saveAmountInput(String inputValue) {
    _amountValue = inputValue;
  }

  void _openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _saveExpense() {
    final amountValue = double.tryParse(_amountValue);
    final isInvalidAmount = amountValue == null || amountValue <= 0;
    List<String> errorMessages = [];

    if (_titleValue.trim().isEmpty ||
        isInvalidAmount ||
        _selectedDate == null) {
      if (_titleValue.trim().isEmpty) {
        errorMessages.add("Title is Empty");
      }
      if (isInvalidAmount) {
        errorMessages.add("Enter Valid amount");
      }
      if (_selectedDate == null) {
        errorMessages.add("Please Select a Date");
      }
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ...errorMessages.map((msg) {
                  return Text(
                    msg,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                  );
                })
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(Expense(
        title: _titleValue,
        amount: amountValue,
        date: _selectedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            onChanged: _saveTitleInput,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: _saveAmountInput,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "\$ ",
                    label: Text("Amount"),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? "No Selected Date"
                        : formatter.format(_selectedDate!)),
                    IconButton(
                        onPressed: _openDatePicker,
                        icon: const Icon(Icons.calendar_month)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close"),
              ),
              ElevatedButton(
                onPressed: _saveExpense,
                child: const Text("Save Expense"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
