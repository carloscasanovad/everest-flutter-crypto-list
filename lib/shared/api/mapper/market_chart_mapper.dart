import 'package:everest_flutter_crypto_list/shared/api/model/market_chart/market_data_response.dart';
import 'package:everest_flutter_crypto_list/shared/api/viewData/market_chart/market_chart_view_data.dart';

extension MarketDataMapper on MarketDataResponse {
  MarketChartViewData toViewMarketChartData() {
    return MarketChartViewData(
      total_volumes: total_volumes[0],
    );
  }
}
