import 'package:everest_flutter_crypto_list/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../wallet/model/crypto_data_view_data.dart';
import '../provider/provider.dart';

class DropDownButtons extends ConsumerStatefulWidget {
  String cryptoLogo;
  String cryptoSymbol;
  List<CryptoDataViewData> cryptoList;
  String selectedCrypto;
  DropDownButtons({
    Key? key,
    required this.cryptoLogo,
    required this.cryptoSymbol,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownButton(
          value: widget.cryptoSymbol,
          items: [
            DropdownMenuItem(
              value: widget.cryptoSymbol,
              child: Row(
                children: [
                  Image.network(
                    widget.cryptoLogo,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(widget.cryptoSymbol),
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
              ref.read(cryptoToConvertDataProvider.notifier).state =
                  widget.cryptoList.firstWhere(
                      (crypto) => crypto.symbol.toUpperCase() == value!);
            },);
          },
        )
      ],
    );
  }
}
