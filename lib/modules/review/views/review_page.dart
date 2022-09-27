import 'package:flutter/material.dart';

import 'package:everest_flutter_crypto_list/modules/review/model/review_arguments.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';

class ReviewPage extends StatelessWidget {
  ReviewArguments reviewArguments;
  ReviewPage({
    Key? key,
    required this.reviewArguments,
  }) : super(key: key);
  static const route = 'review';

  @override
  Widget build(BuildContext context) {
    Map<String, String> rowInformation = {
      'Converter': reviewArguments.cryptoToExchange.toString(),
      'Receber': reviewArguments.cryptoBeingExchanged.toStringAsFixed(6),
      'Câmbio': reviewArguments.cryptoToConvertData.current_price.toString(),
    };
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: kDefaultBackgroundColor,
        title: const Text(
          'Revisar',
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
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Revise os dados da sua conversão'),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          Expanded(
            child: ListView.separated(
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
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 1,
                thickness: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
