import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/user_wallet_model.dart';
import '../../../shared/providers/providers.dart';
import '../providers/providers.dart';
import '../widgets/crypto_list_view.dart';
import '../widgets/header.dart';

class WalletScreen extends HookConsumerWidget {
  const WalletScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<UserWalletModel> userCryptoWallet = [];
    final userWallet = ref.watch(cryptoWalletProvider);
    return userWallet.when(
      data: (data) {
        userCryptoWallet = data.map((item) {
          return UserWalletModel(
            id: item.id,
            userCryptoBalance: item.userCryptoBalance,
          );
        }).toList();

        return SafeArea(
          child: Column(
            children: <Widget>[
              Header(userCryptoWallet: userCryptoWallet),
              CryptoListView(userCryptoWallet: userCryptoWallet),
            ],
          ),
        );
      },
      error: (error, stackTrace) =>
          Text("The following error was found on UserWallet: $error"),
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
