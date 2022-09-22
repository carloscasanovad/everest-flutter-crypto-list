import '../model/market_data_response.dart';
import '../viewData/market_chart_view_data.dart';

extension MarketDataMapper on MarketDataResponse {
  MarketChartViewData toViewMarketChartData() {
    return MarketChartViewData(
      prices: prices,
    );
  }
}
