import 'package:decimal/decimal.dart';

class CryptoListModel {
  String shortName;
  String fullName;
  String cryptoLogo;
  Decimal profitability;
  double userBalance;
  Map<String, double> marketHistoryPrice;
  Map<String, double> percentVariation;
  Map<String, List<List<double>>> marketPriceUpnDown;
  Decimal exchange;
  CryptoListModel({
    required this.shortName,
    required this.fullName,
    required this.cryptoLogo,
    required this.profitability,
    required this.userBalance,
    required this.marketHistoryPrice,
    required this.percentVariation,
    required this.marketPriceUpnDown,
    required this.exchange,
  });

// Sobrescreve o model, caso contrario ao printar os dados
// irá vir como Instance of '';
  @override
  String toString() {
    return 'CryptoListModel(shortName: $shortName, fullName: $fullName, cryptoLogo: $cryptoLogo, profitability: $profitability, userBalance: $userBalance, marketActualPrice: $marketHistoryPrice, percentVariation: $percentVariation, marketPriceVariation: $marketPriceUpnDown, exchange: $exchange)';
  }
}
