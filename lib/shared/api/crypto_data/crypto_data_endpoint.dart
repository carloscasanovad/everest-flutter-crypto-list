
import 'package:dio/dio.dart';

class CryptoDataEndpoint {
  final Dio _dio;

  CryptoDataEndpoint(this._dio);

  Future<Response> getCryptosData() {
    return _dio.get(
        '/markets?vs_currency=brl&order=market_cap_desc&per_page=100&page=1&sparkline=false');
  }
}
