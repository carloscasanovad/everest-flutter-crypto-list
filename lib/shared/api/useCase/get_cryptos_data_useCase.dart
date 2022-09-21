import 'package:everest_flutter_crypto_list/shared/api/mapper/crypto_data_mapper.dart';
import 'package:everest_flutter_crypto_list/shared/api/mapper/market_chart_mapper.dart';
import 'package:everest_flutter_crypto_list/shared/api/repository/crypto_data_repository.dart';

import '../viewData/crypto_data/crypto_list_view_data.dart';
import '../viewData/market_chart/market_chart_view_data.dart';

class GetCryptosDataUseCase {
  final CryptoDataRepository repository;

  GetCryptosDataUseCase({required this.repository});

  Future<CryptoListViewData> execute() async {
    final response = await repository.getAllCryptosData();
    return response.toViewData();
  }

  Future<MarketChartViewData> start() async {
    final response = await repository.getCryptoMarketData();
    return response.toViewMarketChartData();
  }
}
