import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/widgets/default_error_widget.dart';
import '../../../shared/widgets/default_loading_spinner.dart';
import '../model/crypto_data_view_data.dart';
import '../model/user_wallet_model.dart';
import '../controllers/providers.dart';
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
      error: (error, stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        return const DefaultErrorWidget();
      },
      loading: () => const DefaultLoadingSpinner(),
    );
  }
}
