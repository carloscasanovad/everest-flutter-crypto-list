import 'package:everest_flutter_crypto_list/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:everest_flutter_crypto_list/modules/review/model/review_arguments.dart';

import 'review_information_button.dart';

class ReviewInformation extends StatelessWidget {
  ReviewArguments reviewArguments;
  ReviewInformation({
    Key? key,
    required this.reviewArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double exchange = reviewArguments.cryptoToExchangeData.current_price /
        reviewArguments.cryptoBeingExchangeData.current_price;
    String cryptoBeingExchangedSymbol =
        reviewArguments.cryptoBeingExchangeData.symbol.toUpperCase();
    String cryptoToExchangeSymbol =
        reviewArguments.cryptoToExchangeData.symbol.toUpperCase();

    String cryptoBeingExchangedInfo =
        '${reviewArguments.cryptoToExchangeValue.toString()} $cryptoToExchangeSymbol';
    String cryptoToExchangedInfo =
        '${reviewArguments.cryptoBeingExchangedValue.toStringAsFixed(6)} $cryptoBeingExchangedSymbol';
    String exchangeEqualsTo =
        '1$cryptoToExchangeSymbol = ${exchange.toStringAsFixed(6)} $cryptoBeingExchangedSymbol';
    String moneyBeingExchangedInfo =
        'R\$ ${(reviewArguments.cryptoBeingExchangedValue * reviewArguments.cryptoToExchangeData.current_price).toStringAsFixed(4)}';

    Map<String, String> rowInformation = {
      'Converter': cryptoBeingExchangedInfo,
      'Receber': cryptoToExchangedInfo,
      'Câmbio': exchangeEqualsTo,
    };

    return Column(
      children: [
        const Divider(
          height: 1,
          thickness: 1,
        ),
        Expanded(
          child: ListView.separated(
            physics: const ScrollPhysics(
              parent: NeverScrollableScrollPhysics(),
            ),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      rowInformation.keys.elementAt(index),
                      style: kSubtitleTextStyle,
                    ),
                    Text(
                      rowInformation.values.elementAt(index).toString(),
                      style: kDefaultParagraphStyle,
                    ),
                  ],
                ),
              );
            },
            itemCount: rowInformation.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              height: 1,
              thickness: 1,
            ),
          ),
        ),
        ReviewInformationButton(
          cryptoBeingExchangedInfo: cryptoBeingExchangedInfo,
          cryptoToExchangedInfo: cryptoToExchangedInfo,
          moneyBeingExchangedInfo: moneyBeingExchangedInfo,
        ),
      ],
    );
  }
}
