import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'base_endpoint.dart';

final baseEndPointProvider = Provider(
  (ref) {
    final _dio = Dio(BaseOptions(
      baseUrl: 'https://api.coingecko.com/api/v3/coins',
    ));
    return BaseEndpoint(_dio);
  },
);
