
class TransactionsModel {
  String cryptoBeingExchangedInfo;
  String cryptoToExchangeInfo;
  String moneyBeingExchangedInfo;
  String exchangeEqualsTo;
  DateTime date;
  TransactionsModel({
    required this.cryptoBeingExchangedInfo,
    required this.cryptoToExchangeInfo,
    required this.moneyBeingExchangedInfo,
    required this.exchangeEqualsTo,
    required this.date,
  });
}
