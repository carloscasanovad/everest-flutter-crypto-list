import 'dart:math';

import 'package:everest_flutter_crypto_list/modules/wallet/mapper/crypto_data_mapper.dart';

import '../../../shared/repositories/crypto_data_repository.dart';
import '../model/crypto_list_view_data.dart';
import '../model/user_wallet_model.dart';

class GetCryptosDataUseCase {
  final CryptoDataRepository repository;

  GetCryptosDataUseCase({required this.repository});

  Future<CryptoListViewData> execute() async {
    final response = await repository.getAllCryptosData();
    return response.toViewData();
  }

  Future<List<UserWalletModel>> getWallet() async {
    final response = await repository.getAllCryptosData();
    List<UserWalletModel> cryptoWallet = [];
    for (var crypto in response) {
      cryptoWallet.add(UserWalletModel(
        id: crypto.id,
        userCryptoBalance: Random().nextInt(503) * 4,
      ));
    }
    return cryptoWallet;
  }
}
