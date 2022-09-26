import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_flutter_crypto_list/modules/exchange/model/exchange_arguments.dart';
import 'package:everest_flutter_crypto_list/modules/wallet/model/crypto_list_view_data.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../wallet/model/crypto_data_view_data.dart';
import '../../wallet/providers/providers.dart';

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
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xffececec),
              border: Border(
                top: BorderSide(
                  color: Color(0xffc5c5c5),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Saldo disponível:',
                  style: TextStyle(
                    color: Color(0xff757680),
                    fontSize: 17,
                  ),
                ),
                Text(
                  '$userCyptoBalance $cryptoSymbol',
                  style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: cryptosData.when(
        data: (data) {
          List<CryptoDataViewData> cryptoList = data.cryptoListDataView
              .where((crypto) => crypto.symbol != cryptoToExchange)
              .toList();
          String selectedCrypto = cryptoList[0].symbol.toUpperCase();

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Quando você gostaria de converter?'),
              DropDownItems(
                cryptoSymbol: cryptoSymbol,
                cryptoList: cryptoList,
                selectedCrypto: selectedCrypto,
              )
            ],
          );
        },
        error: (error, stackTrace) => Center(
          child: Text('$error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class DropDownItems extends StatefulWidget {
  String cryptoSymbol;
  List<CryptoDataViewData> cryptoList;
  String selectedCrypto;
  DropDownItems({
    Key? key,
    required this.cryptoSymbol,
    required this.cryptoList,
    required this.selectedCrypto,
  }) : super(key: key);

  @override
  State<DropDownItems> createState() => _DropDownItemsState();
}

class _DropDownItemsState extends State<DropDownItems> {
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
                    width: 20,
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
                  Text(widget.cryptoSymbol),
                ],
              ),
            ),
          ],
          onChanged: (value) {},
        ),
        DropdownButton(
          value: widget.selectedCrypto,
          items: getCryptoDropdown(widget.cryptoList),
          menuMaxHeight: 300,
          onChanged: (value) {
            setState(() {
              widget.selectedCrypto = value;
            });
          },
        )
      ],
    );
  }
}
