import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/model/user_wallet_model.dart';
import '../../shared/providers/providers.dart';
import '../widgets/crypto_list_view.dart';
import '../widgets/header.dart';

class WalletScreen extends HookConsumerWidget {
  const WalletScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double userBalance = 0;
    List<UserWalletModel> userCryptoWallet = [];
    final userWallet = ref.watch(cryptoWalletProvider);
    userWallet.whenOrNull(
      data: (data) {
        userCryptoWallet = data.map((item) {
          userBalance += item.userCryptoBalance;
          return UserWalletModel(
            id: item.id,
            userCryptoBalance: item.userCryptoBalance,
          );
        }).toList();
      },
    );
    return SafeArea(
      child: Column(
        children: <Widget>[
          Header(userCryptoWallet: userCryptoWallet),
          CryptoListView(userCryptoWallet: userCryptoWallet),
        ],
      ),
    );
  }
}
