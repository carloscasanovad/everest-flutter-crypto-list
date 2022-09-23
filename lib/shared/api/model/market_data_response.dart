import 'package:json_annotation/json_annotation.dart';

part 'market_data_response.g.dart';

@JsonSerializable()
class MarketDataResponse {
  final List<List<num>> prices;

  MarketDataResponse(this.prices);

  factory MarketDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDataResponseToJson(this);

  @override
  String toString() => 'MarketDataResponse(prices: $prices)';
}
