import 'package:dio/dio.dart';

class CryptoBaseEndpoint {
  final Dio _dio;

  CryptoBaseEndpoint(this._dio);

  Future<Response> getCryptosData() {
    return _dio.get(
        '/markets?vs_currency=brl&order=market_cap_desc&per_page=100&page=1&sparkline=false');
  }

  Future<Response> getCryptoMarketChart(String crypto) {
    return _dio
        .get('/$crypto/market_chart?vs_currency=brl&days=90&interval=daily');
  }
}
