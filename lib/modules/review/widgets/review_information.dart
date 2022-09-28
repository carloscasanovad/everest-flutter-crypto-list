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

    Map<String, String> rowInformation = {
      'Converter':
          '${reviewArguments.cryptoToExchangeValue.toString()} $cryptoToExchangeSymbol',
      'Receber':
          '${reviewArguments.cryptoBeingExchangedValue.toStringAsFixed(6)} $cryptoBeingExchangedSymbol',
      'Câmbio':
          '1$cryptoToExchangeSymbol = ${exchange.toStringAsFixed(6)} $cryptoBeingExchangedSymbol',
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
                      style: const TextStyle(color: Colors.black),
                    ),
                    Text(
                      rowInformation.values.elementAt(index).toString(),
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
        ReviewInformationButton(),
      ],
    );
  }
}
