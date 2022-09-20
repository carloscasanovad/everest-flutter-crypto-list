// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_crypto_volume_chart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCryptoVolumeChartResponse _$GetCryptoVolumeChartResponseFromJson(
        Map<String, dynamic> json) =>
    GetCryptoVolumeChartResponse(
      VolumeChartResponse.fromJson(
          json['total_volumes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCryptoVolumeChartResponseToJson(
        GetCryptoVolumeChartResponse instance) =>
    <String, dynamic>{
      'total_volumes': instance.total_volumes,
    };
