import 'package:everest_flutter_crypto_list/shared/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../shared/widgets/bottom_nav_bar.dart';

class TransactionsPage extends ConsumerStatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);
  static const route = "/transaction";

  @override
  ConsumerState<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends ConsumerState<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    final getCryptoData = ref.watch(cryptosDataProvider);
    final getVolumeChart = ref.watch(marketChartDataProvider);
    return Scaffold(
      body: SafeArea(
          child: getVolumeChart.when(
        data: (data) => Padding(
            padding: EdgeInsets.symmetric(vertical: 26, horizontal: 16),
            child: TextButton(
              onPressed: () {
                print(data.total_volumes);
              },
              child: Text("Data"),
            )),
        error: (error, stackTrace) {
          print(getCryptoData);
          return Center(
            child: Text('$error'),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
      )),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
