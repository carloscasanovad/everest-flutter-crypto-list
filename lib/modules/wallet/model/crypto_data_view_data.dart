// ignore_for_file: non_constant_identifier_names

class CryptoDataViewData {
  final String id;
  late final String symbol;
  final String name;
  final String image;
  final double current_price;
  final double market_cap_change_percentage_24h;
  CryptoDataViewData({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.current_price,
    required this.market_cap_change_percentage_24h,
  });

  @override
  String toString() {
    return 'CryptoDataViewData(id: $id, symbol: $symbol, name: $name, image: $image, current_price: $current_price, market_cap_change_percentage_24h: $market_cap_change_percentage_24h)';
  }
}
