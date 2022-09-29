import 'package:flutter/material.dart';

import '../../../shared/constants/app_text_styles.dart';
import '../model/transactions_model.dart';

class ListTileTransactions extends StatelessWidget {
  const ListTileTransactions({
    Key? key,
    required this.userTransaction,
    required this.formattedDate,
  }) : super(key: key);

  final TransactionsModel userTransaction;
  final String formattedDate;
  @override
  Widget build(BuildContext context) {
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
  }
}
