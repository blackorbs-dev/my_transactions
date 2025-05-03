import '../models/transaction.dart';

abstract class TransactionEvent {}

class FilterTransactions extends TransactionEvent {
  final TransactionStatus status;
  FilterTransactions(this.status);
}
