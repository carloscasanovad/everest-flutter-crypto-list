import '../../modules/transactions/views/transactions_page.dart';
import '../../modules/wallet/views/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../constants/app_colors.dart';
import '../controllers/asset_provider.dart';
import '../controllers/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(navBarIndexProvider);
    return BottomNavigationBar(
      selectedItemColor: kDefaultRed,
      currentIndex: selectedIndex,
      onTap: (index) {
        ref.read(navBarIndexProvider.notifier).state = index;
        index == 0
            ? Navigator.pushNamed(context, WalletPage.route)
            : Navigator.pushNamed(context, TransactionsPage.route);
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const ImageIcon(
            warrenIcon,
            size: 22,
          ),
          label: AppLocalizations.of(context)!.portfolio,
        ),
        BottomNavigationBarItem(
          icon: const ImageIcon(
            cryptoCurrencyIcon,
            size: 24,
          ),
          label: AppLocalizations.of(context)!.transactions,
        ),
      ],
    );
  }
}
