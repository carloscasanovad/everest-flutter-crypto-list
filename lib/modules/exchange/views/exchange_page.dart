import 'package:flutter/material.dart';
import 'package:everest_flutter_crypto_list/modules/exchange/model/exchange_arguments.dart';
import '../widgets/bottom_sheet_widget.dart';
import '../widgets/exchange_body.dart';
import '../widgets/exchange_custom_app_bar.dart';

class ExchangePage extends StatelessWidget {
  static const route = '/exchange';
  ExchangeArguments exchangeArguments;

  ExchangePage({
    Key? key,
    required this.exchangeArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExchangeCustomAppBar(exchangeArguments: exchangeArguments),
      body: ExchangeBody(exchangeArguments: exchangeArguments),
      bottomSheet: const BottomSheetWidget(),
    );
  }
}
