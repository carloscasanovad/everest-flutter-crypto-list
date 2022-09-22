import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'market_chart_endpoint.dart';

final marketChartDataEndPointProvider = Provider(
  (ref) {
    final _dio = Dio(BaseOptions(
      baseUrl: 'https://api.coingecko.com/api/v3/coins',
    ));
    return MarketChartEndpoint(_dio);
  },
);
