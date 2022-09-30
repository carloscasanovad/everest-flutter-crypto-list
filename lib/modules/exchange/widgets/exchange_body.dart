import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/widgets/default_error_widget.dart';
import '../../../shared/widgets/default_loading_spinner.dart';
import '../../wallet/model/crypto_data_view_data.dart';
import '../../wallet/controllers/providers.dart';
import '../model/exchange_arguments.dart';
import 'dropdown_buttons.dart';
import 'exchange_form_field_widget.dart';

class ExchangeBody extends HookConsumerWidget {
  ExchangeArguments exchangeArguments;

  ExchangeBody({
    required this.exchangeArguments,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String cryptoToExchange = exchangeArguments.crypto.symbol;
    final cryptosData = ref.watch(cryptosDataProvider);
    return cryptosData.when(
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
               Text(
                AppLocalizations.of(context)!.exchangeTitle,
                style: kTitle2TextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              DropDownButtons(
                cryptoList: cryptoList,
                selectedCrypto: selectedCrypto,
                exchangeArguments: exchangeArguments,
              ),
              ExchangeFormFieldWidget(
                exchangeArguments: exchangeArguments,
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
    );
  }
}
