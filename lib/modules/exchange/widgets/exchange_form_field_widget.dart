import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../shared/constants/app_colors.dart';
import '../model/exchange_arguments.dart';
import '../provider/provider.dart';

class ExchangeFormFieldWidget extends ConsumerStatefulWidget {
  ExchangeArguments exchangeArguments;
  ExchangeFormFieldWidget({
    Key? key,
    required this.exchangeArguments,
  }) : super(key: key);

  @override
  ConsumerState<ExchangeFormFieldWidget> createState() =>
      _ExchangeFormFieldWidgetState();
}

class _ExchangeFormFieldWidgetState
    extends ConsumerState<ExchangeFormFieldWidget> {
  final formater = NumberFormat("#,##0.00", "pt");
  bool showMoneyHelper = true;
  double moneyToChange = 0;

  @override
  Widget build(BuildContext context) {
    double userCyptoBalance = widget.exchangeArguments.cryptoBalance;
    String cryptoSymbol = widget.exchangeArguments.crypto.symbol.toUpperCase();
    Decimal cryptoPrice =
        Decimal.parse(widget.exchangeArguments.crypto.current_price.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: const TextStyle(
            fontSize: 28,
          ),
          onChanged: (value) {
            if (value != '') {
              Decimal formattedValue =
                  Decimal.parse(value.replaceAll(RegExp(r','), '.'));
              moneyToChange =
                  formattedValue.toDouble() * cryptoPrice.toDouble();
              ref.read(cryptoExchangedProvider.notifier).state = moneyToChange;
              showMoneyHelper = true;
              if (formattedValue > Decimal.parse(userCyptoBalance.toString())) {
                ref.read(cryptoExchangedProvider.notifier).state = 0;
                showMoneyHelper = false;
              }
            }
            setState(() {});
          },
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(
                r'^(\d+)?\,?\d{0,6}',
              ),
            )
          ],
          decoration: InputDecoration(
            prefixIcon: Text(
              '$cryptoSymbol ',
              style: const TextStyle(
                fontSize: 28,
                color: Color(
                  0xff9599A6,
                ),
              ),
            ),
            isDense: true,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
            ),
            hintText: '0,00',
            hintStyle: const TextStyle(
              fontSize: 28,
              color: Color(
                0xff9599A6,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          showMoneyHelper
              ? 'R\$ ${formater.format(moneyToChange)}'
              : 'Saldo insuficiente!',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: showMoneyHelper ? kDefaultBlack : kDefaultRed,
          ),
        ),
      ],
    );
  }
}
