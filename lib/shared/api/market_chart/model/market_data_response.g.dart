// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketDataResponse _$MarketDataResponseFromJson(Map<String, dynamic> json) =>
    MarketDataResponse(
      (json['prices'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
    );

Map<String, dynamic> _$MarketDataResponseToJson(MarketDataResponse instance) =>
    <String, dynamic>{
      'prices': instance.prices,
    };
