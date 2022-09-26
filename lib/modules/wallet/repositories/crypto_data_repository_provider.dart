import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/api/crypto_base_endpoint_provider.dart';
import 'crypto_data_repository.dart';

final cryptoDataRepositoryProvider = Provider(
  (ref) {
    return CryptoDataRepository(
      baseEndpoint: ref.read(cryptoBaseEndPointProvider),
    );
  },
);
