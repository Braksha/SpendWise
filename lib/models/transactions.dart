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
  return outcomes;
}

// List<double> thisWeekIcomes() {
//   List<double> Incomes = [0, 0, 0, 0, 0, 0, 0];
//   int weekday = DateTime.now().weekday;
//   int today = DateTime.now().weekday;

//   for (Transaction transaction in transactions) {
//     if (transaction.type.name == 'Income' &&
//         transaction.created.weekday <= weekday &&
//         today - transaction.created.day < 7) {
//       Incomes[weekday - 1] += transaction.paid;
//     }
//   }
//   print(Incomes);
//   return Incomes;
// }

List<double> thisWeekAmounts(String amountsType) {
  List<double> amounts = [0, 0, 0, 0, 0, 0, 0];
  int weekday = DateTime.now().weekday;
  int today = DateTime.now().weekday;

  for (Transaction transaction in transactions) {
    if (transaction.type.name == amountsType &&
        transaction.created.weekday <= weekday &&
        today - transaction.created.day < 7) {
      amounts[weekday - 1] += transaction.paid.abs();
    }
  }
  // print(Outcomes);
  return amounts;
}
