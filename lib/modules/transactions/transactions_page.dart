import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/widgets/bottom_nav_bar.dart';

class TransactionsPage extends HookConsumerWidget {
  const TransactionsPage({Key? key}) : super(key: key);
  static const route = "/transaction";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffffffff),
        title: const Text(
          'Transactions',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const SafeArea(
        child: Center(child: Text('')),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
