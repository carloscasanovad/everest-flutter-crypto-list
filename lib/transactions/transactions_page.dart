import 'package:flutter/material.dart';

import '../shared/constants/app_text_styles.dart';
import '../shared/widgets/bottom_nav_bar.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);
  static const route = "/transaction";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 26, horizontal: 16),
          child: Text(
            "Movimentações",
            style: kWalletBalanceTextStyle,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
