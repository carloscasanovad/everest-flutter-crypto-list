import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../wallet/model/crypto_data_view_data.dart';

final cryptoExchangedProvider = StateProvider<double>(
  (ref) => 0,
);

final cryptoToConvertDataProvider = StateProvider<CryptoDataViewData>(
  (ref) => CryptoDataViewData(
    id: '',
    symbol: '',
    name: '',
    image: '',
    current_price: 0,
    market_cap_change_percentage_24h: 0,
  ),
);

final ableToExchangeProvider = StateProvider<bool>(
  (ref) => false,
);
