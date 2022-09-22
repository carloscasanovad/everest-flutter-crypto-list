import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/model/crypto_list_model.dart';
import '../providers/providers.dart';
import 'crypto_infomation_row.dart';
import 'crypto_information_variation_row.dart';

class CryptoInformation extends HookConsumerWidget {
  CryptoInformation({
    Key? key,
  }) : super(key: key);

  final formater = NumberFormat("#,##0.00", "pt");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int chartIndex = ref.watch(chartIndexTappedProvider);
    double currentPrice = ref.watch(cryptoPriceProvider);
    double dayVariation = 1000;
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 30,
      ),
      child: Column(
        children: [
          CryptoInformationRow(
            description: 'Preço atual',
            value: 'R\$ ${formater.format(currentPrice)}',
          ),
          CryptoInformationVariationRow(
            description: 'Variação do dia',
            value: dayVariation,
          ),
          const CryptoInformationRow(description: 'Quantidade', value: '2000'
              // '${(Decimal.parse(dataCrypto.userBalance.toString()) * dataCrypto.exchange).toStringAsFixed(2)} ${dataCrypto.shortName}',
              ),
          const CryptoInformationRow(
            description: 'Valor',
            value: '2000',
            // value: 'R\$ ${formater.format(dataCrypto.userBalance)}',
          ),
        ],
      ),
    );
  }
}
