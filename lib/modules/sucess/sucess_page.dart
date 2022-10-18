import 'package:everest_flutter_crypto_list/shared/constants/app_text_styles.dart';
import 'package:everest_flutter_crypto_list/shared/widgets/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/controllers/asset_provider.dart';
import '../exchange/controllers/provider.dart';
import '../wallet/model/crypto_data_view_data.dart';
import '../wallet/views/wallet_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuccessPage extends HookConsumerWidget {
  const SuccessPage({super.key});
  static const route = 'success';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: '',
        onPressed: () {
          ref.read(ableToExchangeProvider.notifier).state = false;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'check',
              child: Image.asset(successIcon),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 15,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.successTitle,
                    style: kSucessTitle1Style,
                  ),
                  Text(
                    AppLocalizations.of(context)!.successSubtitle,
                    style: kSucessTitle2Style,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
