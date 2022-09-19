import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/model/crypto_list_model.dart';

class DetailsHeader extends StatelessWidget {
  final CryptoListModel dataCrypto;
  const DetailsHeader({
    Key? key,
    required this.dataCrypto,
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
              dataCrypto.fullName,
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
              backgroundImage: AssetImage(dataCrypto.cryptoLogo),
            ),
          ],
        ),
        Text(
          dataCrypto.shortName,
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
