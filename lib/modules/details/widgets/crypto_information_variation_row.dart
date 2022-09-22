import 'package:flutter/material.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';

class CryptoInformationVariationRow extends StatelessWidget {
  const CryptoInformationVariationRow({
    Key? key,
    required this.description,
    required this.value,
  }) : super(key: key);

  final String description;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 1,
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(description, style: kDetailsCryptoInfoDescriptionStyle),
            Text(
              ' ${(value).toStringAsFixed(2)}%',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: value > 0 ? kDefaultGreen : kDefaultRed,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
