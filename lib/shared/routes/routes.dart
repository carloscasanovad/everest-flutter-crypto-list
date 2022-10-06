import 'package:everest_flutter_crypto_list/modules/exchange/views/exchange_page.dart';
import 'package:everest_flutter_crypto_list/modules/review/model/review_arguments.dart';
import 'package:everest_flutter_crypto_list/modules/sucess/sucess_page.dart';

import '../../modules/details/views/details_page.dart';
import '../../modules/exchange/model/exchange_arguments.dart';
import '../../modules/review/views/review_page.dart';
import '../../modules/transactions/views/transactions_page.dart';
import '../../modules/wallet/views/wallet_page.dart';
import '../../modules/details/model/crypto_data_arguments.dart';
import 'package:flutter/material.dart';

import '../widgets/default_page_route.dart';

Route<dynamic>? onGenerateRoute(settings) {
  if (settings.name == WalletPage.route) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          const WalletPage(),
    );
  } else if (settings.name == TransactionsPage.route) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          const TransactionsPage(),
    );
  } else if (settings.name == DetailsPage.route) {
    final arguments = settings.arguments as CryptoDataArguments;
    return DefaultPageRoute(
      child: DetailsPage(cryptoDataArguments: arguments),
    );
  } else if (settings.name == ExchangePage.route) {
    final arguments = settings.arguments as ExchangeArguments;
    return DefaultPageRoute(
      child: ExchangePage(exchangeArguments: arguments),
    );
  } else if (settings.name == ReviewPage.route) {
    final arguments = settings.arguments as ReviewArguments;
    return DefaultPageRoute(
      child: ReviewPage(reviewArguments: arguments),
    );
  } else if (settings.name == SuccessPage.route) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          const SuccessPage(),
    );
  }
  return null;
}
