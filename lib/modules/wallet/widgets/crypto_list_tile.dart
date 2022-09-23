import 'package:everest_flutter_crypto_list/modules/details/views/details_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../shared/constants/app_text_styles.dart';
import '../../details/model/crypto_data_arguments.dart';
import '../model/crypto_data_view_data.dart';
import '../providers/providers.dart';

class CryptoListTile extends HookConsumerWidget {
  CryptoDataViewData crypto;
  double cryptoBalance;
  CryptoListTile({
    required this.crypto,
    required this.cryptoBalance,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formater = NumberFormat("#,##0.00", "pt");
    double cryptoBalanceExchanged = cryptoBalance / crypto.current_price;
    bool visibility = ref.watch(visibilityProvider);
    String cryptoSymbol = (crypto.symbol).toUpperCase();

    return ListTile(
      contentPadding: const EdgeInsets.only(left: 15),
      title: Text(
        crypto.name,
        style: kCryptoCardTitleStyle,
      ),
      subtitle: Text(
        crypto.symbol.toUpperCase(),
        style: kCryptoCardSubtitleStyle,
      ),
      leading: CircleAvatar(
        backgroundColor: const Color(0x00ffffff),
        radius: 20,
        backgroundImage: NetworkImage(crypto.image),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                visibility
                    ? 'R\$ ${formater.format(cryptoBalance)}'
                    : 'R\$ $kDefaultHideValues',
                style: kCryptoCardBalanceTrailingTextStyle,
              ),
              Container(
                padding: const EdgeInsets.only(top: 4),
                width: 150,
                height: 20,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    visibility
                        ? '${cryptoBalanceExchanged.toStringAsFixed(2)} $cryptoSymbol'
                        : "$kDefaultHideValues $cryptoSymbol",
                    style: kCryptoCardExchangeTrailingTextStyle,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {
                // ref.read(cryptoPriceProvider.notifier).state =
                //     crypto.current_price;
                Navigator.of(context).pushNamed(
                  DetailsPage.route,
                  arguments: CryptoDataArguments(
                    crypto: crypto,
                    cryptoBalance: cryptoBalanceExchanged.toStringAsFixed(2),
                    cryptoValue: cryptoBalance,
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 14.5,
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
