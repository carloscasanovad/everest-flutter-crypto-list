import 'package:everest_flutter_crypto_list/shared/api/market_chart/mapper/market_chart_mapper.dart';

import '../repository/market_chart_repository.dart';
import '../viewData/market_chart_view_data.dart';

class GetCryptoMarketChartUseCase {
  final MarketChartRepository repository;

  GetCryptoMarketChartUseCase({required this.repository});

  Future<MarketChartViewData> start(String crypto) async {
    final response = await repository.getCryptoMarketData(crypto);
    return response.toViewMarketChartData();
  }
}
