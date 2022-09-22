import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/api/market_chart/viewData/market_chart_view_data.dart';

final chartIndexTappedProvider = StateProvider<int>(
  (ref) => 0,
);
final chartDayProvider = StateProvider<int>(
  (ref) => 84,
);

final cryptoPriceProvider = StateProvider<double>(
  (ref) => 0,
);

final marketChartPricesProvider = StateProvider<MarketChartViewData>(
  (ref) => MarketChartViewData(prices: []),
);
