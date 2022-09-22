import 'package:dio/dio.dart';

class MarketChartEndpoint {
  final Dio _dio;

  MarketChartEndpoint(this._dio);

  Future<Response> getCryptoMarketChart(String crypto) {
    return _dio
        .get('/$crypto/market_chart?vs_currency=brl&days=90&interval=daily');
  }
}
