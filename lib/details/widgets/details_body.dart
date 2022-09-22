import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/api/crypto_data/model/crypto_data_arguments.dart';
import '../../shared/providers/providers.dart';
import '../providers/providers.dart';
import 'convert_crypto_button.dart';
import 'crypto_information.dart';
import 'details_header.dart';
import 'details_line_chart.dart';
import 'line_chart_list_view_buttons.dart';

class DetailsBody extends HookConsumerWidget {
  CryptoDataArguments cryptoDataArguments;
  DetailsBody({
    required this.cryptoDataArguments,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String cryptoId = cryptoDataArguments.crypto.id;
    final marketChartData = ref.watch(marketChartDataProvider(cryptoId));
    return marketChartData.when(
      data: (data) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              DetailsHeader(cryptoDataArguments: cryptoDataArguments),
              DetailsLineChart(marketChartData: data),
              LineChartListViewButtons(marketChartdata: data),
              CryptoInformation(marketChartData: data),
              const ConvertCryptoButton(),
            ],
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text('$error')),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
