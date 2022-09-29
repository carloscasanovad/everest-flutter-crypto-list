import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/providers/notifier.dart';

class ListViewTransactions extends ConsumerStatefulWidget {
  const ListViewTransactions({
    super.key,
  });

  @override
  ConsumerState<ListViewTransactions> createState() =>
      _ListViewTransactionsState();
}

class _ListViewTransactionsState extends ConsumerState<ListViewTransactions> {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userTransactions = ref.watch(UserTransactionsState.movementsprovider);
    return Expanded(
      child: ListView.separated(
        itemCount: userTransactions.length,
        itemBuilder: (BuildContext context, int index) {
          var userTransaction = userTransactions[index];
          String formattedDate =
              DateFormat.yMd('pt-br').format(userTransaction.date);
          return ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
              ),
              child: Text(
                userTransaction.cryptoBeingExchangedInfo,
                style: kDefaultTransactionTitleStyle,
              ),
            ),
            subtitle: Text(
              formattedDate,
              style: kDefaultTransactionSubTitleStyle,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      userTransaction.cryptoToExchangedInfo,
                      style: kDefaultTitle2TitleStyle,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 4),
                      width: 150,
                      height: 25,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                          ),
                          child: Text(
                            userTransaction.moneyBeingExchangedInfo,
                            style: kDefaultTransactionSubTitleStyle,
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
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 1,
          height: 4,
          color: kDefaultLightGrey,
        ),
      ),
    );
  }
}
