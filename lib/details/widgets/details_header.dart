import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/providers/providers.dart';

class DetailsHeader extends HookConsumerWidget {
  const DetailsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getCryptoData = ref.watch(cryptosDataProvider);
    String cryptoName = ref.watch(cryptoFilterProvider);
    return getCryptoData.when(
      data: (data) {
        final cryptoData = data.cryptoListDataView.firstWhere((crypto) {
          return crypto.symbol.toUpperCase() == cryptoName;
        });
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cryptoData.name,
                  style: const TextStyle(
                    fontSize: 32,
                    color: kDefaultBlack,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: const Color(0x00ffffff),
                  radius: 30,
                  backgroundImage: NetworkImage(cryptoData.image),
                ),
              ],
            ),
            Text(
              cryptoData.symbol.toUpperCase(),
              style: const TextStyle(
                fontSize: 17,
                color: kDefaultGrey,
              ),
            ),
            const SizedBox(height: 14),
          ],
        );
      },
      error: (error, stackTrace) => Center(child: Text('$error')),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
