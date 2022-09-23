import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/crypto_data_view_data.dart';
import '../model/user_wallet_model.dart';
import '../providers/providers.dart';
import 'crypto_list_tile.dart';

class CryptoListView extends HookConsumerWidget {
  List<UserWalletModel> userCryptoWallet;
  CryptoListView({
    required this.userCryptoWallet,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoData = ref.watch(cryptosDataProvider);
    return cryptoData.when(
      data: (data) {
        final cryptoData = data.cryptoListDataView;
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(
              parent: ScrollPhysics(),
            ),
            itemCount: cryptoData.length,
            itemBuilder: (context, index) {
              CryptoDataViewData crypto = cryptoData[index];
              return Card(
                child: CryptoListTile(
                  crypto: crypto,
                  cryptoBalance: userCryptoWallet[index].userCryptoBalance,
                ),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text('$error')),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
