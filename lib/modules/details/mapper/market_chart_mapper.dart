import '../../../shared/api/model/market_data_response.dart';
import '../model/market_chart_view_data.dart';

extension MarketDataMapper on MarketDataResponse {
  MarketChartViewData toViewMarketChartData() {
    return MarketChartViewData(
      prices: prices,
    );
  }
}
