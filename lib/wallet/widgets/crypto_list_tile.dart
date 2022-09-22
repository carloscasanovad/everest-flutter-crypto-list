import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:everest_flutter_crypto_list/shared/model/crypto_data_arguments_model.dart';
import 'package:everest_flutter_crypto_list/shared/api/crypto_data/useCase/get_cryptos_data_useCase.dart';
import 'package:everest_flutter_crypto_list/shared/model/user_wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../details/providers/providers.dart';
import '../../shared/api/crypto_data/viewData/crypto_data_view_data.dart';
import '../../shared/constants/app_text_styles.dart';
import '../../shared/providers/providers.dart';
import '../providers/providers.dart';

class CryptoListTile extends ConsumerStatefulWidget {
  CryptoDataViewData crypto;
  double cryptoBalance;
  CryptoListTile({
    Key? key,
    required this.crypto,
    required this.cryptoBalance,
  }) : super(key: key);

  @override
  ConsumerState<CryptoListTile> createState() => _CryptoListTileState();
}

class _CryptoListTileState extends ConsumerState<CryptoListTile> {
  final formater = NumberFormat("#,##0.00", "pt");
  String currencyConverter(double balance, double exchange, String currency) {
    double cryptoExchange = balance / exchange;
    return '${cryptoExchange.toStringAsFixed(2)} $currency';
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool visibility = ref.watch(visibilityProvider);

    return ListTile(
      contentPadding: const EdgeInsets.only(left: 15),
      title: Text(
        widget.crypto.name,
        style: kCryptoCardTitleStyle,
      ),
      subtitle: Text(
        widget.crypto.symbol.toUpperCase(),
        style: kCryptoCardSubtitleStyle,
      ),
      leading: CircleAvatar(
        backgroundColor: const Color(0x00ffffff),
        radius: 20,
        backgroundImage: NetworkImage(widget.crypto.image),
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
                    ? 'R\$ ${formater.format(widget.cryptoBalance)}'
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
                        ? currencyConverter(
                            widget.cryptoBalance.toDouble(),
                            widget.crypto.current_price,
                            widget.crypto.symbol.toUpperCase(),
                          )
                        : "$kDefaultHideValues ${widget.crypto.symbol.toUpperCase()}",
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
                ref.read(cryptoChartProvider.notifier).state = widget.crypto.id;
                ref.read(cryptoPriceProvider.notifier).state =
                    widget.crypto.current_price;
                Navigator.of(context).pushNamed('/details',
                    arguments: CryptoDataArgumentsModel(
                      crypto: widget.crypto,
                      cryptoBalance: currencyConverter(
                        widget.cryptoBalance.toDouble(),
                        widget.crypto.current_price,
                        widget.crypto.symbol.toUpperCase(),
                      ),
                      cryptoValue: widget.cryptoBalance,
                    ));
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
