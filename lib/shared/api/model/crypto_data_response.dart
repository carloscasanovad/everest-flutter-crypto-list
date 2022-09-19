class CryptoDataResponse {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double current_price;
  final double market_cap_change_percentage_24h;
  CryptoDataResponse({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.current_price,
    required this.market_cap_change_percentage_24h,
  });
}
