import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_flutter_crypto_list/shared/constants/app_colors.dart';

import '../../wallet/model/crypto_data_view_data.dart';
import '../model/exchange_arguments.dart';
import '../controllers/provider.dart';

class DropDownButtons extends ConsumerStatefulWidget {
  ExchangeArguments exchangeArguments;
  List<CryptoDataViewData> cryptoList;
  String selectedCrypto;
  DropDownButtons({
    Key? key,
    required this.exchangeArguments,
    required this.cryptoList,
    required this.selectedCrypto,
  }) : super(key: key);

  @override
  ConsumerState<DropDownButtons> createState() => _DropDownItemsState();
}

class _DropDownItemsState extends ConsumerState<DropDownButtons> {
  List<DropdownMenuItem> getCryptoDropdown(
      List<CryptoDataViewData> cryptoList) {
    List<DropdownMenuItem> cryptoDropdown = cryptoList
        .map((crypto) => DropdownMenuItem(
              value: crypto.symbol.toUpperCase(),
              child: Row(
                children: [
                  Image.network(
                    crypto.image,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    crypto.symbol.toUpperCase(),
                  ),
                ],
              ),
            ))
        .toList();
    return cryptoDropdown;
  }

  @override
  Widget build(BuildContext context) {
    String cryptoSymbol = widget.exchangeArguments.crypto.symbol.toUpperCase();
    String cryptoLogo = widget.exchangeArguments.crypto.image;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownButton(
          value: cryptoSymbol,
          items: [
            DropdownMenuItem(
              value: cryptoSymbol,
              child: Row(
                children: [
                  Image.network(
                    cryptoLogo,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(cryptoSymbol),
                ],
              ),
            ),
          ],
          onChanged: (value) {},
        ),
        const Icon(
          Icons.swap_horiz,
          color: kDefaultRed,
          size: 30,
        ),
        DropdownButton(
          value: widget.selectedCrypto,
          items: getCryptoDropdown(widget.cryptoList),
          menuMaxHeight: 300,
          onChanged: (value) {
            setState(() {
              widget.selectedCrypto = value;
              ref.read(cryptoBeingExchangedDataProvider.notifier).state =
                  widget.cryptoList.firstWhere(
                      (crypto) => crypto.symbol.toUpperCase() == value!);
            });
          },
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
