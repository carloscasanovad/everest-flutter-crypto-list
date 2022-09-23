import '../../wallet/model/crypto_data_view_data.dart';

class ExchangeArguments {
  CryptoDataViewData crypto;
  double cryptoBalance;
  double cryptoValue;
  ExchangeArguments({
    required this.crypto,
    required this.cryptoBalance,
    required this.cryptoValue,
  });
}
