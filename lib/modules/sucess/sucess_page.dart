import 'package:everest_flutter_crypto_list/shared/widgets/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/providers/asset_provider.dart';
import '../exchange/provider/provider.dart';
import '../wallet/model/crypto_data_view_data.dart';
import '../wallet/views/wallet_page.dart';

class SuccessPage extends HookConsumerWidget {
  const SuccessPage({super.key});
  static const route = 'success';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: '',
        onPressed: () {
          ref.read(moneyToExchangeProvider.notifier).state = 0;
          ref.read(cryptoBeingExchangedDataProvider.notifier).state =
              CryptoDataViewData(
            id: '',
            symbol: '',
            name: '',
            image: '',
            current_price: 0,
            market_cap_change_percentage_24h: 0,
          );
          Navigator.pushReplacementNamed(context, WalletPage.route);
        },
        icon: Icons.close,
      ),
      body: Center(
        child: Hero(
          tag: 'check',
          child: Image.asset(successIcon),
        ),
      ),
    );
  }
}
