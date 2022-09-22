import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_text_styles.dart';
import '../providers/providers.dart';
import '../widgets/details_body.dart';

class DetailsPage extends HookConsumerWidget {
  DetailsPage({
    Key? key,
  }) : super(key: key);

  static const route = '/details';
  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
      body: const DetailsBody(),
    );
  }
}
