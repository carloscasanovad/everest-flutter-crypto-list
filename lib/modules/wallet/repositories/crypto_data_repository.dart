import 'package:everest_flutter_crypto_list/shared/api/crypto_base_endpoint.dart';

import '../../../shared/api/model/crypto_data_response.dart';

class CryptoDataRepository {
  final CryptoBaseEndpoint baseEndpoint;

  CryptoDataRepository({
    required this.baseEndpoint,
  });

  Future<List<CryptoDataResponse>> getAllCryptosData() async {
    final response = await baseEndpoint.getCryptosData();
    return List<CryptoDataResponse>.from(
      response.data.map((item) => CryptoDataResponse.fromJson(item)),
    );
  }
}
