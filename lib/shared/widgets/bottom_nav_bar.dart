import 'package:everest_flutter_crypto_list/wallet/views/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../constants/app_colors.dart';
import '../providers/asset_provider.dart';
import '../providers/providers.dart';

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
        index == 1
        //Alterar depois
            ? Navigator.pushNamed(context, WalletPage.route)
            : Navigator.pushNamed(context, WalletPage.route);
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(
            warrenIcon,
            size: 22,
          ),
          label: 'Portfólio',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            cryptoCurrencyIcon,
            size: 24,
          ),
          label: 'Movimentações',
        ),
      ],
    );
  }
}
