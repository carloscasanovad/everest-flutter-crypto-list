import 'package:everest_flutter_crypto_list/shared/api/repository/crypto_data_repository_provider.dart';
import 'package:everest_flutter_crypto_list/shared/api/useCase/get_cryptos_data_useCase.dart';
import 'package:everest_flutter_crypto_list/shared/api/viewData/crypto_data_view_data.dart';
import 'package:everest_flutter_crypto_list/shared/api/viewData/volume_chart_view_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/viewData/crypto_list_view_data.dart';

final cryptoFilterProvider = StateProvider<String>(
  (ref) => '',
);
final navBarIndexProvider = StateProvider<int>(
  (ref) => 0,
);

final getCryptosData = Provider((ref) {
  return GetCryptosDataUseCase(
    repository: ref.read(cryptoDataRepositoryProvider),
  );
});

final cryptosDataProvider = FutureProvider<CryptoListViewData>(
  ((ref) async {
    return ref.read(getCryptosData).execute();
  }),
);

final cryptosVolumeChart = FutureProvider<List<VolumeChartViewData>>(
  (ref) async {
    return ref.read(getCryptosData).start();
  },
);
