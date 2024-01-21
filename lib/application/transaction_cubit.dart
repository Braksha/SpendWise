import 'package:bloc/bloc.dart';
import 'package:spendwise/application/transaction_state.dart';
import 'package:spendwise/models/transaction_model.dart';
// import 'package:spendwise/models/transactions.dart';

class TransactionBloc extends Cubit<TransactionState> {
  TransactionBloc(super.initialState);

  void removeTransaction(int index) {
    final List<Transaction> updateTransaction = [...state.transactions];

    updateTransaction.removeAt(index);
    emit(state.copyWith(transactions: updateTransaction));
  }
}

// class TransactionState {}
