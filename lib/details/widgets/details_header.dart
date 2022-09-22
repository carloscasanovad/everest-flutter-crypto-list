import 'package:flutter/material.dart';

import '../../shared/api/crypto_data/viewData/crypto_data_view_data.dart';
import '../../shared/constants/app_colors.dart';

class DetailsHeader extends StatelessWidget {
  CryptoDataViewData cryptoData;
  DetailsHeader({
    Key? key,
    required this.cryptoData,
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
              cryptoData.name,
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
              backgroundImage: NetworkImage(cryptoData.image),
            ),
          ],
        ),
        Text(
          cryptoData.symbol.toUpperCase(),
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
