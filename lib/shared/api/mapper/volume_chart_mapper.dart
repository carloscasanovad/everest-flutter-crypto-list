import 'package:everest_flutter_crypto_list/shared/api/model/volume_chart/get_crypto_volume_chart_response.dart';
import 'package:everest_flutter_crypto_list/shared/api/viewData/volume_chart_view_data.dart';

extension VolumeChartMapper on GetCryptoVolumeChartResponse {
  List<VolumeChartViewData> toViewDataVolumeChart() {
    return total_volumes.values
        .map((e) => VolumeChartViewData(total_volumes: total_volumes.values))
        .toList();
  }
}
