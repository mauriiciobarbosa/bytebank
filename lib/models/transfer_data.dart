class TransferData {
  final double value;
  final int accountNumber;

  TransferData(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transfer(value=$value, accountNumber=$accountNumber)';
  }
}
