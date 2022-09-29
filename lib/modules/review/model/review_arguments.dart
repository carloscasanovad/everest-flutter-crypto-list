import 'package:everest_flutter_crypto_list/modules/wallet/model/crypto_data_view_data.dart';

class ReviewArguments {
  double cryptoToExchangeValue;
  double cryptoBeingExchangedValue;
  CryptoDataViewData cryptoBeingExchangeData;
  CryptoDataViewData cryptoToExchangeData;
  ReviewArguments({
    required this.cryptoToExchangeValue,
    required this.cryptoToExchangeData,
    required this.cryptoBeingExchangedValue,
    required this.cryptoBeingExchangeData,
  });
}
