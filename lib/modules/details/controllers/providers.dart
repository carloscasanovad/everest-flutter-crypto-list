import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/market_chart_view_data.dart';
import '../repositories/market_chart_repository_provider.dart';
import '../useCase/get_crypto_market_chart_useCase.dart';

final chartIndexTappedProvider = StateProvider.autoDispose<int>(
  (ref) => 5,
);
final chartDayProvider = StateProvider.autoDispose<int>(
  (ref) => 5,
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
