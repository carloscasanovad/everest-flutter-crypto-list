import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../model/transactions_model.dart';
import 'transaction_modal_details.dart';

class ListTileTransactions extends StatelessWidget {
  TransactionsModel userTransaction;
  String formattedDate;
  ListTileTransactions({
    Key? key,
    required this.userTransaction,
    required this.formattedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formatedDateTime =
        DateFormat('dd/MM/yyyy  -  ').add_jm().format(userTransaction.date);
    Map<String, String> transactionDetails = {
      AppLocalizations.of(context)!.quantityConverted: userTransaction.cryptoBeingExchangedInfo,
      AppLocalizations.of(context)!.quantityReceive: userTransaction.cryptoToExchangeInfo,
      AppLocalizations.of(context)!.total: userTransaction.moneyBeingExchangedInfo,
      AppLocalizations.of(context)!.exchangeRate: userTransaction.exchangeEqualsTo,
    };
    return ListTile(
      onTap: (() {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return TransactionModalDetails(
              formatedDateTime: formatedDateTime,
              transactionDetails: transactionDetails,
            );
          },
        );
      }),
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
                userTransaction.cryptoToExchangeInfo,
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
