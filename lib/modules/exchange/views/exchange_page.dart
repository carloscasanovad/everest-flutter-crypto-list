import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:everest_flutter_crypto_list/modules/exchange/model/exchange_arguments.dart';
import 'package:everest_flutter_crypto_list/modules/exchange/widgets/dropdown_buttons.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../wallet/model/crypto_data_view_data.dart';
import '../../wallet/providers/providers.dart';
import '../provider/provider.dart';
import '../widgets/bottom_sheet_widget.dart';
import '../widgets/exchange_form_field_widget.dart';
import '../widgets/user_balance.dart';

class ExchangePage extends ConsumerStatefulWidget {
  static const route = '/exchange';
  ExchangeArguments exchangeArguments;

  ExchangePage({
    Key? key,
    required this.exchangeArguments,
  }) : super(key: key);

  @override
  ConsumerState<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends ConsumerState<ExchangePage> {
  @override
  Widget build(BuildContext context) {
    String userCyptoBalance =
        widget.exchangeArguments.cryptoBalance.toStringAsFixed(6);
    String cryptoSymbol = widget.exchangeArguments.crypto.symbol.toUpperCase();
    String cryptoToExchange = widget.exchangeArguments.crypto.symbol;
    String cryptoLogo = widget.exchangeArguments.crypto.image;

    final cryptosData = ref.watch(cryptosDataProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: kDefaultBackgroundColor,
        title: const Text(
          'Converter',
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: UserBalance(
            userCyptoBalance: userCyptoBalance,
            cryptoSymbol: cryptoSymbol,
          ),
        ),
      ),
      body: cryptosData.when(
        data: (data) {
          List<CryptoDataViewData> cryptoList = data.cryptoListDataView
              .where((crypto) => crypto.symbol != cryptoToExchange)
              .toList();
          String selectedCrypto = cryptoList[0].symbol.toUpperCase();

          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Quanto você gostaria de converter?',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownButtons(
                  cryptoSymbol: cryptoSymbol,
                  cryptoList: cryptoList,
                  selectedCrypto: selectedCrypto,
                  cryptoLogo: cryptoLogo,
                ),
                const SizedBox(
                  height: 5,
                ),
                ExchangeFormFieldWidget(
                  exchangeArguments: widget.exchangeArguments,
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Text('$error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      bottomSheet: BottomSheetWidget(),
    );
  }
}
