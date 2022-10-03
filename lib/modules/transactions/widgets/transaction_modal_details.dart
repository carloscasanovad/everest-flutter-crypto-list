import 'package:flutter/material.dart';
import 'transaction_modal_details_body.dart';
import 'transaction_modal_details_header.dart';

class TransactionModalDetails extends StatelessWidget {
  const TransactionModalDetails({
    Key? key,
    required this.formatedDateTime,
    required this.transactionDetails,
  }) : super(key: key);

  final String formatedDateTime;
  final Map<String, String> transactionDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: Column(
        children: [
          TransactionModalDetailsHeader(
            formatedDateTime: formatedDateTime,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: transactionDetails.length,
            itemBuilder: (context, index) {
              return TransactionModalDetailsBody(
                transactionDetails: transactionDetails,
                index: index,
              );
            },
          )
        ],
      ),
    );
  }
}
