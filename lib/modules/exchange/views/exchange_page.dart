import 'package:flutter/material.dart';

import 'package:everest_flutter_crypto_list/modules/details/model/crypto_data_arguments.dart';
import 'package:everest_flutter_crypto_list/modules/exchange/model/exchange_arguments.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';

class ExchangePage extends StatelessWidget {
  ExchangeArguments exchangeArguments;
  ExchangePage({
    Key? key,
    required this.exchangeArguments,
  }) : super(key: key);

  static const route = '/exchange';
  @override
  Widget build(BuildContext context) {
    String userCyptoBalance =
        exchangeArguments.cryptoBalance.toStringAsFixed(6);
    String cryptoSymbol = exchangeArguments.crypto.symbol.toUpperCase();
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: kDefaultBackgroundColor,
        title: const Text(
          'Converter',
          style: kDetailsTitleTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kDefaultBlack,
            size: 21,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xffececec),
              border: Border(
                top: BorderSide(
                  color: Color(0xffc5c5c5),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Saldo disponível:',
                  style: TextStyle(
                    color: Color(0xff757680),
                    fontSize: 17,
                  ),
                ),
                Text(
                  '$userCyptoBalance $cryptoSymbol',
                  style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Quando você gostaria de converter?'),
          Row(
            children: [
              DropdownButton(
                value: cryptoSymbol,
                items: [
                  DropdownMenuItem(
                    value: cryptoSymbol,
                    child: Row(children: [
                      Text(cryptoSymbol),
                    ]),
                  ),
                ],
                onChanged: (value) {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
