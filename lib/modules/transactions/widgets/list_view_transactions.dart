import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/controllers/user_transaction_notifier.dart';
import 'list_tile_transactions.dart';

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
    final userTransactions = ref.watch(movementsProvider);
    return Expanded(
      child: ListView.separated(
        itemCount: userTransactions.length,
        itemBuilder: (BuildContext context, int index) {
          var userTransaction = userTransactions[index];
          String formattedDate =
              DateFormat.yMd('pt-br').format(userTransaction.date);

          return ListTileTransactions(
            userTransaction: userTransaction,
            formattedDate: formattedDate,
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
