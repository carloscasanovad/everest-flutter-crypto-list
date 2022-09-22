import 'dart:math';

import 'package:everest_flutter_crypto_list/shared/api/crypto_data/mapper/crypto_data_mapper.dart';
import 'package:everest_flutter_crypto_list/shared/model/user_wallet_model.dart';

import '../repository/crypto_data_repository.dart';
import '../viewData/crypto_list_view_data.dart';

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
