class CryptoDataViewData {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double marketCapChangePercentage24h;
  CryptoDataViewData({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCapChangePercentage24h,
  });
}


// class Crypto extends CryptoDataViewData {
//   final coin;

//   Crypto({
//     required this.coin,
//     required super.id,
//     required super.symbol,
//     required super.name,
//     required super.image,
//     required super.currentPrice,
//     required super.marketCapChangePercentage24h,
//   });

// }
