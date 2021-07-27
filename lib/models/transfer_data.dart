class TransferData {
  final double value;
  final int accountNumber;
  int order;

  static int numberOfTransfers = 0;

  TransferData({
    this.order = 0,
    required this.value,
    required this.accountNumber,
  }) {
    this.order = numberOfTransfers++;
  }

  @override
  String toString() {
    return 'TransferData{value: $value, accountNumber: $accountNumber, order: $order}';
  }
}
