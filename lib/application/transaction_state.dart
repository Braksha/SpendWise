import 'package:spendwise/models/transaction_model.dart';

class TransactionState {
  TransactionState({
    required this.transactions,
  });

  final List<Transaction> transactions;

  TransactionState copyWith({
    List<Transaction>? cartItems,
    required List<Transaction> transactions,
  }) {
    return TransactionState(
      transactions: transactions ?? this.transactions,
    );
  }
}
