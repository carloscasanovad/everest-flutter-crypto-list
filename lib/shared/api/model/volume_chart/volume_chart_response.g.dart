// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_chart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeChartResponse _$VolumeChartResponseFromJson(Map<String, dynamic> json) =>
    VolumeChartResponse(
      (json['values'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
    );

Map<String, dynamic> _$VolumeChartResponseToJson(
        VolumeChartResponse instance) =>
    <String, dynamic>{
      'values': instance.values,
    };
