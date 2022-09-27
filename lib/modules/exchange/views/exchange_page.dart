import 'package:everest_flutter_crypto_list/modules/exchange/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_flutter_crypto_list/modules/exchange/model/exchange_arguments.dart';
import 'package:everest_flutter_crypto_list/modules/exchange/widgets/dropdown_buttons.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/widgets/default_error_widget.dart';
import '../../../shared/widgets/default_loading_spinner.dart';
import '../../wallet/model/crypto_data_view_data.dart';
import '../../wallet/providers/providers.dart';
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
            ref.watch(cryptoExchangedProvider.notifier).state = 0;
            ref.watch(cryptoToConvertDataProvider.notifier).state ==
                CryptoDataViewData(
                  id: '',
                  symbol: '',
                  name: '',
                  image: '',
                  current_price: 0,
                  market_cap_change_percentage_24h: 0,
                );
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
            userCryptoBalance: widget.exchangeArguments.cryptoBalance,
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
                  style: kTitle2TextStyle,
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
                  cryptoList: cryptoList,
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          debugPrintStack(stackTrace: stackTrace);
          return const DefaultErrorWidget();
        },
        loading: () => const DefaultLoadingSpinner(),
      ),
      bottomSheet: const BottomSheetWidget(),
    );
  }
}
