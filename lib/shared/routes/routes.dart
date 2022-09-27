import 'package:everest_flutter_crypto_list/modules/exchange/views/exchange_page.dart';
import 'package:everest_flutter_crypto_list/modules/review/model/review_arguments.dart';

import '../../modules/details/views/details_page.dart';
import '../../modules/exchange/model/exchange_arguments.dart';
import '../../modules/review/views/review_page.dart';
import '../../modules/transactions/transactions_page.dart';
import '../../modules/wallet/views/wallet_page.dart';
import '../../modules/details/model/crypto_data_arguments.dart';
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
  } else if (settings.name == ExchangePage.route) {
    final arguments = settings.arguments as ExchangeArguments;
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return ExchangePage(exchangeArguments: arguments);
      },
    );
  } else if (settings.name == ReviewPage.route) {
    final arguments = settings.arguments as ReviewArguments;
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return ReviewPage(reviewArguments: arguments);
      },
    );
  }
  return null;
}
