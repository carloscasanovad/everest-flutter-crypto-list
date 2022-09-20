import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';


part 'crypto_data_response.g.dart';

@JsonSerializable()
class CryptoDataResponse {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double marketCapChangePercentage24h;
  CryptoDataResponse({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCapChangePercentage24h,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'symbol': symbol});
    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'currentPrice': currentPrice});
    result
        .addAll({'marketCapChangePercentage24h': marketCapChangePercentage24h});

    return result;
  }

  factory CryptoDataResponse.fromMap(Map<String, dynamic> map) {
    return CryptoDataResponse(
      id: map['id'] ?? '',
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      currentPrice: map['currentPrice']?.toDouble() ?? 0.0,
      marketCapChangePercentage24h:
          map['marketCapChangePercentage24h']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoDataResponse.fromJson(String source) =>
      CryptoDataResponse.fromMap(json.decode(source));
}
