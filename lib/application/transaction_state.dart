import 'package:spendwise/models/transaction_model.dart';

class TransactionState {
  TransactionState({
    required this.transactions,
  });

  final List<Transaction> transactions;

  @override
  String toString() {
    return 'TransactionState(transactions: $transactions)';
  }

  TransactionState copyWith({
    List<Transaction>? transactions,
  }) {
    return TransactionState(
      transactions: transactions ?? this.transactions,
    );
  }
}
