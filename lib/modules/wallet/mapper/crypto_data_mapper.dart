import '../../../shared/api/model/crypto_data_response.dart';
import '../model/crypto_data_view_data.dart';
import '../model/crypto_list_view_data.dart';

extension CriptoCoinMapper on List<CryptoDataResponse> {
  CryptoListViewData toViewData() {
    return CryptoListViewData(
      cryptoListDataView: map((crypto) {
        return CryptoDataViewData(
          current_price: crypto.current_price,
          id: crypto.id,
          image: crypto.image,
          market_cap_change_percentage_24h:
              crypto.market_cap_change_percentage_24h,
          name: crypto.name,
          symbol: crypto.symbol,
        );
      }).toList(),
    );
  }
}
