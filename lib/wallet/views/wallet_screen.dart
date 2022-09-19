import 'package:flutter/material.dart';

import '../widgets/crypto_list_view.dart';
import '../widgets/header.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const <Widget>[
          Header(),
          CryptoListView(),
        ],
      ),
    );
  }
}
