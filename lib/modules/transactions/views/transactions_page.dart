import 'package:everest_flutter_crypto_list/shared/constants/app_colors.dart';
import 'package:everest_flutter_crypto_list/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../widgets/list_view_transactions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            children:  [
              Text(
                AppLocalizations.of(context)!.transactions,
                style: kTitle3TextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 10,
                thickness: 1,
                color: kDefaultLightGrey,
              ),
              const ListViewTransactions(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
