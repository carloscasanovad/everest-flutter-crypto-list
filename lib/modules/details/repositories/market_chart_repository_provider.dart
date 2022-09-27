import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../shared/api/crypto_base_endpoint_provider.dart';
import 'market_chart_repository.dart';

final marketChartRepositoryProvider = Provider(
  (ref) {
    return MarketChartRepository(
      baseEndPoint: ref.read(cryptoBaseEndPointProvider),
    );
  },
);
