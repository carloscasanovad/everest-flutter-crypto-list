import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:everest_flutter_crypto_list/shared/api/crypto_data/model/crypto_data_arguments.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_text_styles.dart';
import '../providers/providers.dart';
import '../widgets/details_body.dart';

class DetailsPage extends HookConsumerWidget {
  CryptoDataArguments cryptoDataArguments;
  DetailsPage({
    Key? key,
    required this.cryptoDataArguments,
  }) : super(key: key);

  static const route = '/details';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(cryptoDataArguments.crypto);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDefaultBackgroundColor,
        title: const Text(
          'Detalhes',
          style: kDetailsTitleTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            ref.read(chartDayProvider.notifier).state = 85;
            ref.read(chartIndexTappedProvider.notifier).state = 0;
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kDefaultBlack,
            size: 21,
          ),
        ),
      ),
      body: DetailsBody(
        cryptoDataArguments: cryptoDataArguments,
      ),
    );
  }
}
