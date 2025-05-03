enum TransactionStatus { all, successful, pending, failed }

extension TitleCaseExtension on Enum {
  String titleCase() {
    return name[0].toUpperCase() + name.substring(1).toLowerCase();
  }
}

class Transaction {
  final int id;
  final String amount;
  final String date;
  final TransactionStatus status;

  Transaction(this.id, {required this.amount, required this.date, required this.status});
}
