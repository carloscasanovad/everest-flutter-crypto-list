import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';


part 'crypto_data_response.g.dart';

@JsonSerializable()
class CryptoDataResponse {
  final String id;
  final String symbol;
  final String name;
  final String image;
  // ignore: non_constant_identifier_names
  final double current_price;
  // ignore: non_constant_identifier_names
  final double market_cap_change_percentage_24h;
  CryptoDataResponse({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    // ignore: non_constant_identifier_names
    required this.current_price,
    // ignore: non_constant_identifier_names
    required this.market_cap_change_percentage_24h,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'symbol': symbol});
    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'current_price': current_price});
    result
        .addAll({'market_cap_change_percentage_24h': market_cap_change_percentage_24h});

    return result;
  }

  factory CryptoDataResponse.fromMap(Map<String, dynamic> map) {
    return CryptoDataResponse(
      id: map['id'] ?? '',
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      current_price: map['current_price']?.toDouble() ?? 0.0,
      market_cap_change_percentage_24h:
          map['market_cap_change_percentage_24h']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoDataResponse.fromJson(String source) =>
      CryptoDataResponse.fromMap(json.decode(source));
}
