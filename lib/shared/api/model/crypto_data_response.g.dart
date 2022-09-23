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
      current_price: (json['current_price'] as num).toDouble(),
      market_cap_change_percentage_24h:
          (json['market_cap_change_percentage_24h'] as num).toDouble(),
    );

Map<String, dynamic> _$CryptoDataResponseToJson(CryptoDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.current_price,
      'market_cap_change_percentage_24h':
          instance.market_cap_change_percentage_24h,
    };
