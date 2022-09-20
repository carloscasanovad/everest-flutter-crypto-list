import 'package:everest_flutter_crypto_list/shared/api/viewData/crypto_data/crypto_list_view_data.dart';

import '../model/crypto_data/crypto_data_response.dart';
import '../viewData/crypto_data/crypto_data_view_data.dart';

extension CriptoCoinMapper on List<CryptoDataResponse> {
  CryptoListViewData toViewData() {
    return CryptoListViewData(
      cryptoListDataView: map((crypto) {
        return CryptoDataViewData(
          currentPrice: crypto.currentPrice,
          id: crypto.id,
          image: crypto.image,
          marketCapChangePercentage24h: crypto.marketCapChangePercentage24h,
          name: crypto.name,
          symbol: crypto.symbol,
        );
      }).toList(),
    );
  }
}
