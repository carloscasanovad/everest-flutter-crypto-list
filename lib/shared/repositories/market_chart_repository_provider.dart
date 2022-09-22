import '../api/market_chart/market_chart_endpoint_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'market_chart_repository.dart';

final marketChartRepositoryProvider = Provider(
  (ref) {
    return MarketChartRepository(
      marketChartEndpoint: ref.read(marketChartDataEndPointProvider),
    );
  },
);
