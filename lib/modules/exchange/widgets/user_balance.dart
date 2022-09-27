import 'package:flutter/material.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../model/exchange_arguments.dart';

class UserBalance extends StatelessWidget {
  ExchangeArguments exchangeArguments;

  UserBalance({
    Key? key,
    required this.exchangeArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userCyptoBalance =
        exchangeArguments.cryptoBalance.toStringAsFixed(6);
    String cryptoSymbol = exchangeArguments.crypto.symbol.toUpperCase();
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 50,
        decoration: const BoxDecoration(
          color: kDefaultMiddleGrey,
          border: Border(
            top: BorderSide(
              color: kDefaultSoftGrey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Saldo disponível:',
              style: kDefaultGreyParagraphStyle,
            ),
            Text(
              '$userCyptoBalance $cryptoSymbol',
              style: kDefaultParagraphStyle,
            ),
          ],
        ),
      ),
    );
  }
}
