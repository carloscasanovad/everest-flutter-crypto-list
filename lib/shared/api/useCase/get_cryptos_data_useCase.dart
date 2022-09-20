import 'package:everest_flutter_crypto_list/shared/api/mapper/crypto_data_mapper.dart';
import 'package:everest_flutter_crypto_list/shared/api/mapper/volume_chart_mapper.dart';
import 'package:everest_flutter_crypto_list/shared/api/repository/crypto_data_repository.dart';
import 'package:everest_flutter_crypto_list/shared/api/viewData/volume_chart_view_data.dart';
import '../viewData/crypto_list_view_data.dart';

class GetCryptosDataUseCase {
  final CryptoDataRepository repository;

  GetCryptosDataUseCase({required this.repository});

  Future<CryptoListViewData> execute() async {
    final response = await repository.getAllCryptosData();
    return response.toViewData();
  }

  Future<List<VolumeChartViewData>> start() async {
    final response = await repository.getCryptMarketChartData();
    return response.toViewDataVolumeChart();
  }
}
