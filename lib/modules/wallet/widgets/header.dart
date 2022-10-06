import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../model/user_wallet_model.dart';
import '../controllers/providers.dart';

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

  String getUserBalance() {
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
                       Text(
                        AppLocalizations.of(context)!.crypto,
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
                        visibility ? getUserBalance() : kDefaultHideValues,
                        style: kWalletBalanceTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.userBalance,
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
