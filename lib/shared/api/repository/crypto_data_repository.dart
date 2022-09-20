import 'package:everest_flutter_crypto_list/shared/api/crypto_data_endpoint.dart';
import 'package:everest_flutter_crypto_list/shared/api/model/crypto_data_response.dart';
import 'package:everest_flutter_crypto_list/shared/api/model/volume_chart/get_crypto_volume_chart_response.dart';

class CryptoDataRepository {
  final CryptoDataEndpoint cryptoDataEndpoint;

  CryptoDataRepository({
    required this.cryptoDataEndpoint,
  });

  Future<List<CryptoDataResponse>> getAllCryptosData() async {
    final response = await cryptoDataEndpoint.getCryptosData();
    return List<CryptoDataResponse>.from(
      response.data.map((item) => CryptoDataResponse.fromMap(item)),
    );
  }

  Future<GetCryptoVolumeChartResponse> getCryptMarketChartData() async {
    final response = await cryptoDataEndpoint.getCryptoMarketChart();
    print(response.data);
    return GetCryptoVolumeChartResponse.fromJson(response.data);
  }
}
