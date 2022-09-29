
class TransactionsModel {
  String cryptoBeingExchangedInfo;
  String cryptoToExchangedInfo;
  String moneyBeingExchangedInfo;
  DateTime date;
  TransactionsModel({
    required this.cryptoBeingExchangedInfo,
    required this.cryptoToExchangedInfo,
    required this.moneyBeingExchangedInfo,
    required this.date,
  });
}
