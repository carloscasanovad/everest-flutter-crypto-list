import 'package:everest_flutter_crypto_list/modules/wallet/model/crypto_data_view_data.dart';

class ReviewArguments {
  double cryptoToExchange;
  double cryptoBeingExchanged;
  CryptoDataViewData cryptoToConvertData;
  ReviewArguments({
    required this.cryptoToExchange,
    required this.cryptoBeingExchanged,
    required this.cryptoToConvertData,
  });
}
