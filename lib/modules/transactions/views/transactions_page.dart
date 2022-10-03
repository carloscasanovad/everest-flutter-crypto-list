import 'package:everest_flutter_crypto_list/shared/constants/app_colors.dart';
import 'package:everest_flutter_crypto_list/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../widgets/list_view_transactions.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});
  static const route = "/transaction";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Movimentações',
                style: kTitle3TextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: kDefaultLightGrey,
              ),
              ListViewTransactions(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
