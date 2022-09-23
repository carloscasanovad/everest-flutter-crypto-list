import 'package:flutter/material.dart';

import '../../../shared/constants/app_colors.dart';
import '../model/crypto_data_arguments.dart';

class DetailsHeader extends StatelessWidget {
  CryptoDataArguments cryptoDataArguments;

  DetailsHeader({
    Key? key,
    required this.cryptoDataArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cryptoDataArguments.crypto.name,
              style: const TextStyle(
                fontSize: 32,
                color: kDefaultBlack,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            CircleAvatar(
              backgroundColor: const Color(0x00ffffff),
              radius: 30,
              backgroundImage: NetworkImage(cryptoDataArguments.crypto.image),
            ),
          ],
        ),
        Text(
          cryptoDataArguments.crypto.symbol.toUpperCase(),
          style: const TextStyle(
            fontSize: 17,
            color: kDefaultGrey,
          ),
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}
