// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoDataResponse _$CryptoDataResponseFromJson(Map<String, dynamic> json) =>
    CryptoDataResponse(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      currentPrice: (json['currentPrice'] as num).toDouble(),
      marketCapChangePercentage24h:
          (json['marketCapChangePercentage24h'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoDataResponseToJson(CryptoDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'currentPrice': instance.currentPrice,
      'marketCapChangePercentage24h': instance.marketCapChangePercentage24h,
    };
