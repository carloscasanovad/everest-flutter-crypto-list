import 'package:everest_flutter_crypto_list/modules/details/model/crypto_data_arguments.dart';
import 'package:flutter/material.dart';

import 'package:everest_flutter_crypto_list/modules/exchange/model/exchange_arguments.dart';
import 'package:everest_flutter_crypto_list/modules/exchange/views/exchange_page.dart';

import '../../../shared/constants/app_colors.dart';

class ConvertCryptoButton extends StatelessWidget {
  CryptoDataArguments cryptoDataArguments;
  ConvertCryptoButton({
    Key? key,
    required this.cryptoDataArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            ExchangePage.route,
            arguments: ExchangeArguments(
              crypto: cryptoDataArguments.crypto,
              cryptoBalance: cryptoDataArguments.cryptoBalance,
              cryptoValue: cryptoDataArguments.cryptoValue,
            ),
          );
        },
        minWidth: MediaQuery.of(context).size.width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: kDefaultRed),
        ),
        color: kDefaultRed,
        child: const Text(
          'Converter moeda',
          style: TextStyle(
            fontSize: 17,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}
