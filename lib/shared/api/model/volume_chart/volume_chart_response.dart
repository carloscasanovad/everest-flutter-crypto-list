import 'package:json_annotation/json_annotation.dart';

part 'volume_chart_response.g.dart';

@JsonSerializable()
class VolumeChartResponse {
  final Map<String, List<List<num>>> values;

  VolumeChartResponse(this.values);

  factory VolumeChartResponse.fromJson(Map<String, dynamic> json) =>
      _$VolumeChartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeChartResponseToJson(this);
}
