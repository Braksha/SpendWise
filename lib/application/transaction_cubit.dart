import 'package:bloc/bloc.dart';
import 'package:spendwise/application/transaction_state.dart';
import 'package:spendwise/models/transaction_model.dart';
// import 'package:spendwise/models/transactions.dart';

class TransactionBloc extends Cubit<TransactionState> {
  TransactionBloc(super.initialState);

  void removeTransaction(int index) {
    // print(state.transactions[0].paid);
    final List<Transaction> updateTransactions = [...state.transactions];

    updateTransactions.removeAt(index);
    // print(updateTransactions);
    emit(state.copyWith(transactions: updateTransactions));
  }
}

// class TransactionState {}
