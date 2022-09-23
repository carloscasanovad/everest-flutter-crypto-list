import 'package:everest_flutter_crypto_list/modules/wallet/useCases/get_cryptos_data_useCase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../modules/wallet/model/crypto_list_view_data.dart';
import '../../modules/wallet/model/user_wallet_model.dart';
import '../repositories/crypto_data_repository_provider.dart';

final navBarIndexProvider = StateProvider<int>(
  (ref) => 0,
);
