import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'market_data_response.g.dart';

@JsonSerializable()
class MarketDataResponse {
  // ignore: non_constant_identifier_names
  final List<List<num>> total_volumes;

  MarketDataResponse(this.total_volumes);

  factory MarketDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDataResponseToJson(this);

  @override
  String toString() => 'MarketDataResponse(total_volumes: $total_volumes)';
}
