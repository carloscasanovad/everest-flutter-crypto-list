import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../shared/widgets/default_error_widget.dart';
import '../../../shared/widgets/default_loading_spinner.dart';
import '../model/user_wallet_model.dart';
import '../controllers/providers.dart';
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
      error: (error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        return const DefaultErrorWidget();
      },
      loading: () => const DefaultLoadingSpinner(),
    );
  }
}
