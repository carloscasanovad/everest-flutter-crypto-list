import '../model/crypto_data_arguments.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/market_chart_view_data.dart';
import '../providers/providers.dart';
import 'crypto_infomation_row.dart';
import 'crypto_information_variation_row.dart';

class CryptoInformation extends HookConsumerWidget {
  MarketChartViewData marketChartData;
  CryptoDataArguments cryptoDataArguments;
  CryptoInformation({
    Key? key,
    required this.marketChartData,
    required this.cryptoDataArguments,
  }) : super(key: key);

  final formater = NumberFormat("#,##0.00", "pt");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // double currentPrice = ref.watch(cryptoPriceProvider);
    List<List<num>> cryptoChartPrices = marketChartData.prices;
    int marketChartDay =
        cryptoChartPrices.length - 1 - ref.watch(chartDayProvider);
    double currentPrice = cryptoChartPrices[marketChartDay][1].toDouble();
    String cryptoId = cryptoDataArguments.crypto.symbol.toUpperCase();

    double getDayVariation() {
      double initialValue =
          cryptoChartPrices[cryptoChartPrices.length - 1][1].toDouble();
      double finalValue = cryptoChartPrices[marketChartDay][1].toDouble();

      double dayVariation = (initialValue / finalValue - 1) * 100;
      return dayVariation;
    }

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
            value: getDayVariation(),
          ),
          CryptoInformationRow(
            description: 'Quantidade',
            value: '${cryptoDataArguments.cryptoBalance} $cryptoId',
          ),
          CryptoInformationRow(
            description: 'Valor',
            value:
                'R\$ ${formater.format(cryptoDataArguments.cryptoValue).toString()}',
          ),
        ],
      ),
    );
  }
}
