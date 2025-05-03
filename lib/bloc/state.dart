import '../models/transaction.dart';

class TransactionState {
  final List<Transaction> transactions;
  final TransactionStatus selectedFilter;

  TransactionState({required this.transactions, required this.selectedFilter});

  // TransactionState copyWith({
  //   required List<Transaction> transactions,
  //   required TransactionStatus selectedFilter,
  // }) {
  //   return TransactionState(
  //     transactions: transactions,
  //     selectedFilter: selectedFilter,
  //   );
  // }
}
