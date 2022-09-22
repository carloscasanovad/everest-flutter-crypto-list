import 'package:flutter/material.dart';

import '../../details/views/details_page.dart';
import '../../transactions/transactions_page.dart';
import '../../wallet/views/wallet_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  WalletPage.route: (context) => const WalletPage(),
  // TransactionsPage.route: (context) => const TransactionsPage(),
  DetailsPage.route: (context) => DetailsPage(),
};
