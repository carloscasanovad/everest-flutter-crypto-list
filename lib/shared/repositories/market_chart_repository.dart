import 'package:everest_flutter_crypto_list/shared/api/base_endpoint.dart';

import '../api/market_chart/model/market_data_response.dart';

class MarketChartRepository {
  final BaseEndpoint baseEndPoint;

  MarketChartRepository({required this.baseEndPoint});

  Future<MarketDataResponse> getCryptoMarketData(String crypto) async {
    final response = await baseEndPoint.getCryptoMarketChart(crypto);
    return MarketDataResponse.fromJson(response.data);
  }
}
