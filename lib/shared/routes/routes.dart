import '../../modules/details/views/details_page.dart';
import '../../modules/transactions/transactions_page.dart';
import '../../modules/wallet/views/wallet_page.dart';
import '../model/crypto_data_arguments.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(settings) {
  if (settings.name == WalletPage.route) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return const WalletPage();
      },
    );
  } else if (settings.name == TransactionsPage.route) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return const TransactionsPage();
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
