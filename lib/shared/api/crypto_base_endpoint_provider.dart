import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'crypto_base_endpoint.dart';

final cryptoBaseEndPointProvider = Provider(
  (ref) {
    final _dio = Dio(BaseOptions(
      baseUrl: 'https://api.coingecko.com/api/v3/coins',
    ));
    return CryptoBaseEndpoint(_dio);
  },
);
