import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/transaction.dart';
import 'event.dart';
import 'state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final List<Transaction> allTransactions = [
    Transaction(1, amount: "\$150", date: "2025-05-01", status: TransactionStatus.successful),
    Transaction(2, amount: "\$90", date: "2025-05-01", status: TransactionStatus.failed),
    Transaction(3, amount: "\$250", date: "2025-05-02", status: TransactionStatus.pending),
    Transaction(4, amount: "\$300", date: "2025-05-03", status: TransactionStatus.successful),
    Transaction(5, amount: "\$120", date: "2025-05-04", status: TransactionStatus.failed),
  ];

  TransactionBloc()
      : super(TransactionState(transactions: [], selectedFilter: TransactionStatus.all)) {
    on<FilterTransactions>((event, emit) {
      final filtered = event.status == TransactionStatus.all
          ? allTransactions
          : allTransactions.where((tx) => tx.status == event.status).toList();
      emit(TransactionState(transactions: filtered, selectedFilter: event.status));
    });

    // Load all transactions on init
    add(FilterTransactions(TransactionStatus.all));
  }
}
