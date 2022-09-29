import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/crypto_list_view_data.dart';
import '../model/user_wallet_model.dart';
import '../repositories/crypto_data_repository_provider.dart';
import '../useCases/get_cryptos_data_useCase.dart';

final visibilityProvider = StateProvider<bool>(
  (ref) => true,
);
final cryptoWalletProvider = FutureProvider<List<UserWalletModel>>((ref) async {
  return await ref.read(getCryptosDataProvider).getWallet();
});
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
