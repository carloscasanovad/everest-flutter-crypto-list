import '../api/crypto_data/crypto_data_endpoint.dart';
import '../api/crypto_data/model/crypto_data_response.dart';

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
}
