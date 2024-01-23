import 'package:bloc/bloc.dart';
import 'package:spendwise/application/transaction_state.dart';
import 'package:spendwise/models/transaction_model.dart';
// import 'package:spendwise/models/transactions.dart';

class TransactionBloc extends Cubit<TransactionState> {
  TransactionBloc(super.initialState);
  void addTransaction(Transaction transaction) {
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
}

// class TransactionState {}
