import 'package:everest_flutter_crypto_list/modules/exchange/provider/provider.dart';
import 'package:everest_flutter_crypto_list/modules/wallet/model/crypto_data_view_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';

class BottomSheetWidget extends HookConsumerWidget {
  const BottomSheetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CryptoDataViewData cryptoToConvert = ref.watch(cryptoToConvertDataProvider);
    bool ableToExchange = ref.watch(ableToExchangeProvider);
    double cryptoExchanged = ref.watch(cryptoExchangedProvider);
    print(cryptoToConvert);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: kDefaultSoftGrey,
          ),
        ),
      ),
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total estimado:',
                style: kDefaultGreyTitleStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                cryptoExchanged != 0
                    ? '${(cryptoExchanged / cryptoToConvert.current_price).toStringAsFixed(6)} ${cryptoToConvert.symbol.toUpperCase()}'
                    : '',
                style: kDefaultParagraphStyle,
              ),
            ],
          ),
          FloatingActionButton(
            isExtended: true,
            backgroundColor: ableToExchange ? kDefaultRed : kDefaultSoftGrey,
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
