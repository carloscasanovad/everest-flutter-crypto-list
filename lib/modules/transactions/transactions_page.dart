import 'package:everest_flutter_crypto_list/modules/wallet/providers/providers.dart';
import 'package:everest_flutter_crypto_list/shared/constants/app_colors.dart';
import 'package:everest_flutter_crypto_list/shared/constants/app_text_styles.dart';
import 'package:everest_flutter_crypto_list/shared/providers/notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../shared/widgets/bottom_nav_bar.dart';

class TransactionsPage extends HookConsumerWidget {
  const TransactionsPage({Key? key}) : super(key: key);
  static const route = "/transaction";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibility = ref.watch(visibilityProvider);
    final userTransactions = ref.watch(UserTransactionsState.movementsprovider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Movimentações',
                style: kTitle3TextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 10,
                thickness: 1,
                color: kDefaultLightGrey,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: userTransactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    var userTransaction = userTransactions[index];
                    String formattedDate =
                        DateFormat.yMd().format(userTransaction.date);
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          userTransaction.cryptoBeingExchangedInfo,
                          style: kDefaultGreyParagraphStyle,
                        ),
                      ),
                      subtitle: Text(
                        formattedDate,
                        style: kDefaultGreyParagraphStyle,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                visibility
                                    ? userTransaction.cryptoToExchangedInfo
                                    : 'R\$ $kDefaultHideValues',
                                style: kDefaultParagraphStyle,
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 4),
                                width: 150,
                                height: 25,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                    child: Text(
                                      visibility
                                          ? userTransaction
                                              .moneyBeingExchangedInfo
                                          : kDefaultHideValues,
                                      style: kDefaultGreyParagraphStyle,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    thickness: 1,
                    height: 4,
                    color: kDefaultLightGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
