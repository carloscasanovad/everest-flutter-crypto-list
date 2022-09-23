import 'package:flutter/material.dart';

import '../../../shared/widgets/bottom_nav_bar.dart';
import 'wallet_screen.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);
  static const route = '/wallet';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WalletScreen(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
