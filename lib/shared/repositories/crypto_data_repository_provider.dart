import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/crypto_data/crypto_data_endpoint_provider.dart';
import 'crypto_data_repository.dart';

final cryptoDataRepositoryProvider = Provider(
  (ref) {
    return CryptoDataRepository(
      cryptoDataEndpoint: ref.read(cryptoDataEndPointProvider),
    );
  },
);
