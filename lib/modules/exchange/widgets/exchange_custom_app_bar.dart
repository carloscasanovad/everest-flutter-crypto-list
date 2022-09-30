import 'package:everest_flutter_crypto_list/modules/exchange/widgets/user_balance.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../wallet/model/crypto_data_view_data.dart';
import '../model/exchange_arguments.dart';
import '../controllers/provider.dart';

class ExchangeCustomAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const ExchangeCustomAppBar({
    Key? key,
    required this.exchangeArguments,
  }) : super(key: key);

  final ExchangeArguments exchangeArguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      elevation: 3,
      backgroundColor: kDefaultBackgroundColor,
      title:  Text(
        AppLocalizations.of(context)!.convert,
        style: kDetailsTitleTextStyle,
      ),
      leading: IconButton(
        onPressed: () {
          ref.read(moneyToExchangeProvider.notifier).state = 0;
          ref.read(cryptoBeingExchangedDataProvider.notifier).state =
              CryptoDataViewData(
            id: '',
            symbol: '',
            name: '',
            image: '',
            current_price: 0,
            market_cap_change_percentage_24h: 0,
          );
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: kDefaultBlack,
          size: 21,
        ),
      ),
      bottom: UserBalance(
        exchangeArguments: exchangeArguments,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 100);
}
