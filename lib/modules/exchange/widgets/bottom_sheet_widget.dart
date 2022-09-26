import 'package:everest_flutter_crypto_list/modules/exchange/provider/provider.dart';
import 'package:everest_flutter_crypto_list/modules/wallet/model/crypto_data_view_data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/constants/app_colors.dart';

class BottomSheetWidget extends HookConsumerWidget {
  const BottomSheetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CryptoDataViewData cryptoToConvert = ref.watch(cryptoToConvertDataProvider);
    double cryptoExchanged = ref.watch(cryptoExchangedProvider);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xffc5c5c5),
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
                style: TextStyle(
                  fontSize: 16.5,
                  color: Color(0xff757680),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                cryptoExchanged != 0
                    ? '${(cryptoExchanged / cryptoToConvert.current_price).toStringAsFixed(6)} ${cryptoToConvert.symbol.toUpperCase()}'
                    : '',
                style: const TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          FloatingActionButton(
            isExtended: true,
            backgroundColor: kDefaultRed,
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onPressed: () {
              print(cryptoExchanged);
              print(cryptoToConvert.current_price);
            },
          ),
        ],
      ),
    );
  }
}
