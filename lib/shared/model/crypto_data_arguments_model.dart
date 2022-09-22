import 'package:everest_flutter_crypto_list/shared/api/crypto_data/viewData/crypto_data_view_data.dart';

class CryptoDataArgumentsModel {
  CryptoDataViewData crypto;
  String cryptoBalance;
  double cryptoValue;
  CryptoDataArgumentsModel({
    required this.crypto,
    required this.cryptoBalance,
    required this.cryptoValue,
  });
}
