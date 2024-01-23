import 'package:bloc/bloc.dart';
import 'package:spendwise/application/transaction_state.dart';
import 'package:spendwise/models/transaction_model.dart';

class TransactionBloc extends Cubit<TransactionState> {
  TransactionBloc(super.initialState);
  void addTransaction(double amount, TransactionType transactionType, String name) {
    double paid = amount;

    if (transactionType.name == 'Outcome') paid *= -1;

    Transaction transaction = Transaction(
      name,
      paid,
      transactionType,
    );
    final List<Transaction> updateTransactions = [
      ...state.transactions,
      transaction
    ];
    emit(state.copyWith(transactions: updateTransactions));
  }

  void removeTransaction(int index) {
    final List<Transaction> updateTransactions = [...state.transactions];

    updateTransactions.removeAt(index);
    emit(state.copyWith(transactions: updateTransactions));
  }

  void updatetotal (){


  }
      double get totalBalance => state. transactions.isNotEmpty? state. transactions
      .map((transaction) => transaction.paid)
      .reduce((value, element) => value + element): 0;

  double thisMonthIncomes() {
    double incomes = 0;
    for (Transaction transaction in state.transactions) {
      if (transaction.created.month == DateTime.now().month &&
          transaction.type.name == 'Income') {
        incomes += transaction.paid;
      }
    }
    return incomes;
  }

  double thisMonthOutcomes() {
    double outcomes = 0;

    for (Transaction transaction in state.transactions) {
      if (transaction.created.month == DateTime.now().month &&
          transaction.type.name == 'Outcome') {
        outcomes += transaction.paid;
      }
    }
    return outcomes;
  }

  List<double> thisWeekAmounts(String amountsType) {
    List<double> amounts = [0, 0, 0, 0, 0, 0, 0];
    int weekday = DateTime.now().weekday;
    int today = DateTime.now().weekday;

    for (Transaction transaction in state.transactions) {
      if (transaction.type.name == amountsType &&
          transaction.created.weekday <= weekday &&
          today - transaction.created.day < 7) {
        amounts[weekday - 1] += transaction.paid.abs();
      }
    }
    // print(Outcomes);
    return amounts;
  }

}

// class TransactionState {}
