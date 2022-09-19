import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'crypto_data_endpoint.dart';

final cryptoDataProvider = Provider((ref) {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.coingecko.com/api/v3/coins',
    ),
  );
  return CryptoDataEndpoint(_dio);
});
