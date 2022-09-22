import 'package:everest_flutter_crypto_list/shared/model/crypto_data_arguments_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/api/market_chart/viewData/market_chart_view_data.dart';
import '../providers/providers.dart';
import 'crypto_infomation_row.dart';
import 'crypto_information_variation_row.dart';

class CryptoInformation extends HookConsumerWidget {
  MarketChartViewData marketChartData;
  CryptoDataArgumentsModel cryptoDataArguments;
  CryptoInformation({
    Key? key,
    required this.marketChartData,
    required this.cryptoDataArguments,
  }) : super(key: key);

  final formater = NumberFormat("#,##0.00", "pt");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double currentPrice = ref.watch(cryptoPriceProvider);
    int marketChartDay = ref.watch(chartDayProvider);
    List<List<num>> cryptoChartPrices = marketChartData.prices;
    double initialValue =
        cryptoChartPrices[cryptoChartPrices.length - 1][1].toDouble();
    double finalValue = cryptoChartPrices[marketChartDay][1].toDouble();
    double dayVariation = (initialValue / finalValue - 1) * 100;
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
          CryptoInformationRow(
            description: 'Quantidade',
            value: cryptoDataArguments.cryptoBalance,
          ),
          CryptoInformationRow(
            description: 'Valor',
            value: 'R\$ ${formater.format(cryptoDataArguments.cryptoValue).toString()}',
          ),
        ],
      ),
    );
  }
}
