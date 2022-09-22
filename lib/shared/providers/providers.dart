import 'package:everest_flutter_crypto_list/shared/api/market_chart/repository/market_chart_repository_provider.dart';
import 'package:everest_flutter_crypto_list/shared/api/market_chart/useCase/get_crypto_market_chart_useCase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_flutter_crypto_list/shared/api/crypto_data/useCase/get_cryptos_data_useCase.dart';

import '../api/crypto_data/repository/crypto_data_repository_provider.dart';
import '../api/crypto_data/viewData/crypto_list_view_data.dart';
import '../api/market_chart/viewData/market_chart_view_data.dart';
import '../api/market_chart/viewData/market_filter_view_data.dart';

final cryptoFilterProvider = StateProvider<String>(
  (ref) => '',
);
final navBarIndexProvider = StateProvider<int>(
  (ref) => 0,
);
final cryptoChartProvider = StateProvider<String>(
  (ref) => '',
);

final getCryptosDataProvider = Provider((ref) {
  return GetCryptosDataUseCase(
    repository: ref.read(cryptoDataRepositoryProvider),
  );
});

final cryptosDataProvider = FutureProvider<CryptoListViewData>(
  ((ref) async {
    return await ref.read(getCryptosDataProvider).execute();
  }),
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
