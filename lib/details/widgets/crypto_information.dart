import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/api/market_chart/viewData/market_chart_view_data.dart';
import '../providers/providers.dart';
import 'crypto_infomation_row.dart';
import 'crypto_information_variation_row.dart';

class CryptoInformation extends HookConsumerWidget {
  MarketChartViewData marketChartData;
  CryptoInformation({
    Key? key,
    required this.marketChartData,
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
