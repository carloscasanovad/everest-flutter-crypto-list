import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared/constants/app_text_styles.dart';

class TransactionModalDetailsHeader extends StatelessWidget {
  const TransactionModalDetailsHeader({
    Key? key,
    required this.formatedDateTime,
  }) : super(key: key);

  final String formatedDateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.transactionBillTitle,
          style: const TextStyle(
            fontSize: 26,
          ),
        ),
        Text(
          AppLocalizations.of(context)!.transactionBillSubtitle,
          style: const TextStyle(
            fontSize: 26,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          formatedDateTime,
          style: kDefaultTransactionSubTitleStyle,
        ),
        const Divider(
          height: 40,
          thickness: 1,
        ),
      ],
    );
  }
}
