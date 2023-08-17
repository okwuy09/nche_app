class Transactions {
  Transactions({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
    required this.isCredited,
    required this.status,
  });
  String id, type, amount, status;
  DateTime date;
  bool isCredited;
}
