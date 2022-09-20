import 'package:everest_flutter_crypto_list/shared/api/crypto_data_provider.dart';
import 'package:everest_flutter_crypto_list/shared/api/repository/crypto_data_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cryptoDataRepositoryProvider = Provider(
  (ref) {
    return CryptoDataRepository(
      cryptoDataEndpoint: ref.read(cryptoDataEndPointProvider),
    );
  },
);
