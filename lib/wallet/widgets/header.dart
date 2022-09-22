import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../shared/constants/app_text_styles.dart';
import '../../shared/model/user_wallet_model.dart';
import '../providers/providers.dart';

class Header extends ConsumerStatefulWidget {
  List<UserWalletModel> userCryptoWallet;
  Header({
    required this.userCryptoWallet,
  });

  @override
  ConsumerState<Header> createState() => _WalletHeaderState();
}

class _WalletHeaderState extends ConsumerState<Header> {
  final formater = NumberFormat("#,##0.00", "pt");
  double balance = 0;

  String getUserBalance(double balance) {
    for (var crypto in widget.userCryptoWallet) {
      balance += crypto.userCryptoBalance;
      setState(() {});
    }
    return formater.format(balance);
  }

  @override
  Widget build(BuildContext context) {
    final bool visibility = ref.watch(visibilityProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Wrap(
                runSpacing: 10,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Cripto',
                        style: kTitleTextStyle,
                      ),
                      IconButton(
                        onPressed: () {
                          ref.read(visibilityProvider.notifier).state =
                              !visibility;
                          setState(() {});
                        },
                        icon: Icon(
                          visibility
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          size: 26,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "R\$ ",
                        style: kWalletBalanceTextStyle,
                      ),
                      Text(
                        visibility
                            ? getUserBalance(balance)
                            : kDefaultHideValues,
                        style: kWalletBalanceTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        "Valor total de moedas",
                        style: kSubtitleTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
