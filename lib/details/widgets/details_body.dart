import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/providers/providers.dart';
import 'convert_crypto_button.dart';
import 'crypto_information.dart';
import 'details_header.dart';
import 'details_line_chart.dart';

class DetailsBody extends HookConsumerWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getCryptoData = ref.watch(cryptosDataProvider);
    String cryptoName = ref.watch(cryptoFilterProvider);
    return getCryptoData.when(
      data: (data) {
        final cryptoData = data.cryptoListDataView.firstWhere((crypto) {
          return crypto.symbol.toUpperCase() == cryptoName;
        });
        
        return SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              DetailsHeader(cryptoData: cryptoData),
              DetailsLineChart(),
              CryptoInformation(),
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
