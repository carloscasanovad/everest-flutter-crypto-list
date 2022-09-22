import 'package:everest_flutter_crypto_list/shared/api/crypto_data/model/crypto_data_arguments.dart';
import 'package:flutter/material.dart';

import '../../details/views/details_page.dart';
import '../../wallet/views/wallet_page.dart';

Route<dynamic>? onGenerateRoute(settings) {
  if (settings.name == WalletPage.route) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return const WalletPage();
      },
    );
  } else if (settings.name == DetailsPage.route) {
    final arguments = settings.arguments as CryptoDataArguments;
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return DetailsPage(cryptoDataArguments: arguments);
      },
    );
  }
  return null;
}
