import 'package:flutter/material.dart';

class UserBalance extends StatelessWidget {
  String userCyptoBalance;
  String cryptoSymbol;
  UserBalance({
    Key? key,
    required this.userCyptoBalance,
    required this.cryptoSymbol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xffececec),
          border: Border(
            top: BorderSide(
              color: Color(0xffc5c5c5),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Saldo disponível:',
              style: TextStyle(
                color: Color(0xff757680),
                fontSize: 17,
              ),
            ),
            Text(
              '$userCyptoBalance $cryptoSymbol',
              style: const TextStyle(
                color: Color(0xff000000),
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
