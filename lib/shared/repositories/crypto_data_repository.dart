import 'package:everest_flutter_crypto_list/shared/api/base_endpoint.dart';

import '../api/crypto_data/model/crypto_data_response.dart';

class CryptoDataRepository {
  final BaseEndpoint baseEndpoint;

  CryptoDataRepository({
    required this.baseEndpoint,
  });

  Future<List<CryptoDataResponse>> getAllCryptosData() async {
    final response = await baseEndpoint.getCryptosData();
    return List<CryptoDataResponse>.from(
      response.data.map((item) => CryptoDataResponse.fromMap(item)),
    );
  }
}
