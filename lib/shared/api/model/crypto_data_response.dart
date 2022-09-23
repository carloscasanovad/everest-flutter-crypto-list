// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'crypto_data_response.g.dart';

@JsonSerializable()
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

  factory CryptoDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoDataResponseToJson(this);
}
