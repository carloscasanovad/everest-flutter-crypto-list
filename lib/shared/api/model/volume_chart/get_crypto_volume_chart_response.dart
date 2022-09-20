import 'dart:convert';

import 'package:everest_flutter_crypto_list/shared/api/model/volume_chart/volume_chart_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_crypto_volume_chart_response.g.dart';

@JsonSerializable()
class GetCryptoVolumeChartResponse {
  final VolumeChartResponse total_volumes;
  GetCryptoVolumeChartResponse(this.total_volumes);

  factory GetCryptoVolumeChartResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCryptoVolumeChartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCryptoVolumeChartResponseToJson(this);
}
