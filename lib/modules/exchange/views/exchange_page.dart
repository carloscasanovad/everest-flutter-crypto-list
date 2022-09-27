import 'package:everest_flutter_crypto_list/modules/exchange/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:everest_flutter_crypto_list/modules/exchange/model/exchange_arguments.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../wallet/model/crypto_data_view_data.dart';
import '../widgets/bottom_sheet_widget.dart';
import '../widgets/exchange_body.dart';
import '../widgets/user_balance.dart';

class ExchangePage extends HookConsumerWidget {
  static const route = '/exchange';
  ExchangeArguments exchangeArguments;

  ExchangePage({
    Key? key,
    required this.exchangeArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            ref.read(cryptoExchangedProvider.notifier).state = 0;
            ref.read(cryptoToConvertDataProvider.notifier).state ==
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
            exchangeArguments: exchangeArguments,
          ),
        ),
      ),
      body: ExchangeBody(
        exchangeArguments: exchangeArguments,
      ),
      bottomSheet: const BottomSheetWidget(),
    );
  }
}
