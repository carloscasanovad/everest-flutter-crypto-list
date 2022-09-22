import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/repositories/market_chart_repository_provider.dart';
import '../model/market_chart_view_data.dart';
import '../useCase/get_crypto_market_chart_useCase.dart';

final chartIndexTappedProvider = StateProvider<int>(
  (ref) => 0,
);
final chartDayProvider = StateProvider<int>(
  (ref) => 84,
);

final cryptoPriceProvider = StateProvider<double>(
  (ref) => 0,
);

final getMarketChartDataProvider = Provider((ref) {
  return GetCryptoMarketChartUseCase(
    repository: ref.read(marketChartRepositoryProvider),
  );
});

final marketChartDataProvider =
    FutureProvider.autoDispose.family<MarketChartViewData, dynamic>(
  ((ref, args) async {
    return await ref.read(getMarketChartDataProvider).start(args);
  }),
);
