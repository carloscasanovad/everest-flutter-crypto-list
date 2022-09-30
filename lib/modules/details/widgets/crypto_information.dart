import '../model/crypto_data_arguments.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../model/market_chart_view_data.dart';
import '../controllers/providers.dart';
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
    List<List<num>> cryptoChartPrices = marketChartData.prices;
    String cryptoId = cryptoDataArguments.crypto.symbol.toUpperCase();
    int marketChartDay = cryptoChartPrices.length - ref.watch(chartDayProvider);
    double selectedDayPrice = cryptoChartPrices[marketChartDay][1].toDouble();

    double getDayVariation() {
      double initialValue =
          cryptoChartPrices[cryptoChartPrices.length - 1][1].toDouble();
      double dayVariation = (initialValue / selectedDayPrice - 1) * 100;
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
            description: AppLocalizations.of(context)!.currentPrice,
            value: 'R\$ ${formater.format(selectedDayPrice)}',
          ),
          CryptoInformationVariationRow(
            description: AppLocalizations.of(context)!.priceVariation,
            value: getDayVariation(),
          ),
          CryptoInformationRow(
            description: AppLocalizations.of(context)!.userCryptoQuantity,
            value:
                '${cryptoDataArguments.cryptoBalance.toStringAsFixed(2)} $cryptoId',
          ),
          CryptoInformationRow(
            description: AppLocalizations.of(context)!.userCryptoValue,
            value:
                'R\$ ${formater.format(cryptoDataArguments.cryptoValue).toString()}',
          ),
        ],
      ),
    );
  }
}
