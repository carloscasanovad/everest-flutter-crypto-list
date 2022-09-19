import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';

class ConvertCryptoButton extends StatelessWidget {
  const ConvertCryptoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: MaterialButton(
        onPressed: () {},
        minWidth: MediaQuery.of(context).size.width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: kDefaultRed),
        ),
        color: kDefaultRed,
        child: const Text(
          'Converter moeda',
          style: TextStyle(
            fontSize: 17,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}
