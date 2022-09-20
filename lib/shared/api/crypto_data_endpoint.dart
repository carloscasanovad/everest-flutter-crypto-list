import 'package:dio/dio.dart';

class CryptoDataEndpoint {
  final Dio _dio;

  CryptoDataEndpoint(this._dio);

  Future<Response> getCryptosData() {
    return _dio.get(
        '/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false');
  }

  Future<Response> getCryptoMarketChart() {
    return _dio
        .get('/bitcoin/market_chart?vs_currency=usd&days=5&interval=daily');
  }
}
