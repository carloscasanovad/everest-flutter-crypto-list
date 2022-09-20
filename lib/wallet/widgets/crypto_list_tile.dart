import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/api/viewData/crypto_data/crypto_data_view_data.dart';
import '../../shared/constants/app_text_styles.dart';
import '../../shared/model/crypto_list_model.dart';
import '../../shared/providers/providers.dart';
import '../providers/providers.dart';

class CryptoListTile extends HookConsumerWidget {
  CryptoDataViewData crypto;
  CryptoListTile({
    Key? key,
    required this.crypto,
  }) : super(key: key);

  final formater = NumberFormat("#,##0.00", "pt");
  String currencyConverter(Decimal balance, Decimal exchange, String currency) {
    Decimal cryptoExchange = balance * exchange;
    return '${cryptoExchange.toStringAsFixed(2)} $currency';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool visibility = ref.watch(visibilityProvider);
    final userBalance = 0;
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
                    ? 'R\$ ${formater.format(userBalance)}'
                    : 'R\$ $kDefaultHideValues',
                style: kCryptoCardBalanceTrailingTextStyle,
              ),
              Container(
                padding: const EdgeInsets.only(top: 4),
                width: 100,
                height: 20,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    visibility
                        ? currencyConverter(
                            Decimal.parse(userBalance.toString()),
                            Decimal.parse('2500'),
                            // crypto.exchange,
                            crypto.symbol.toUpperCase(),
                          )
                        : "$kDefaultHideValues ${crypto.symbol.toUpperCase()}",
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
                ref.read(cryptoFilterProvider.notifier).state =
                    crypto.name;
                Navigator.of(context).pushNamed('/details');
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
  }
}
