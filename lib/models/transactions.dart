import 'package:flutter/material.dart';
import 'package:spendwise/models/transaction_model.dart';

double totalBalance = transactions
    .map((transaction) => transaction.paid)
    .reduce((value, element) => value + element);

List<Transaction> transactions = [
  Transaction('Fuel', 20.0, types[1]),
  Transaction('Fuel', 20.0, types[1]),
  Transaction('Fuel', -20.0, types[0]),
];

List<TransactionType> types = [
  TransactionType(
    'Outcome',
    Icon(Icons.arrow_circle_up, color: Colors.red),
  ),
  TransactionType(
    'Income',
    Icon(Icons.arrow_circle_down, color: Colors.green),
  ),
];

double thisMonthIncomes() {
  double incomes = 0;
  for (Transaction transaction in transactions) {
    if (transaction.created.month == DateTime.now().month &&
        transaction.type.name == 'Income') {
      incomes += transaction.paid;
    }
  }
  return incomes;
}

double thisMonthOutcomes() {
  double outcomes = 0;

  for (Transaction transaction in transactions) {
    if (transaction.created.month == DateTime.now().month &&
        transaction.type.name == 'Outcome') {
      outcomes += transaction.paid;
    }
  }
  // totalBalance -= outcomes;
  print('****************************$outcomes');
  return outcomes;
}
