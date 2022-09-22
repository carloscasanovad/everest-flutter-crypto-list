import '../api/market_chart/market_chart_endpoint.dart';
import '../api/market_chart/model/market_data_response.dart';

class MarketChartRepository {
  final MarketChartEndpoint marketChartEndpoint;

  MarketChartRepository({required this.marketChartEndpoint});

  Future<MarketDataResponse> getCryptoMarketData(String crypto) async {
    final response = await marketChartEndpoint.getCryptoMarketChart(crypto);
    return MarketDataResponse.fromJson(response.data);
  }
}