import 'package:flutter/material.dart';

import '../../../shared/constants/app_text_styles.dart';

class CryptoInformationRow extends StatelessWidget {
  const CryptoInformationRow({
    Key? key,
    required this.description,
    required this.value,
  }) : super(key: key);

  final String description;
  final String value;

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
            Text(value, style: kDetailsCryptoInfoValueStyle),
          ],
        ),
      ],
    );
  }
}
