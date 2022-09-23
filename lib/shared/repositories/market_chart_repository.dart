import 'package:everest_flutter_crypto_list/shared/api/crypto_base_endpoint.dart';

import '../api/model/market_data_response.dart';

class MarketChartRepository {
  final CryptoBaseEndpoint baseEndPoint;

  MarketChartRepository({required this.baseEndPoint});

  Future<MarketDataResponse> getCryptoMarketData(String crypto) async {
    final response = await baseEndPoint.getCryptoMarketChart(crypto);
    return MarketDataResponse.fromJson(response.data);
  }
}
