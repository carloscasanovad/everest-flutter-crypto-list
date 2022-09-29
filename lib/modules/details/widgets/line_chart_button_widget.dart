import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../controllers/providers.dart';

class LineChartButtonWidget extends HookConsumerWidget {
  int dayRange;
  LineChartButtonWidget({
    required this.dayRange,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int chartIndexTapped = ref.watch(chartIndexTappedProvider);
    return Container(
      margin: const EdgeInsets.only(
        top: 17,
        right: 10,
      ),
      width: 35,
      child: MaterialButton(
        elevation: 0,
        padding: const EdgeInsets.all(1),
        color: chartIndexTapped == dayRange
            ? kDefaultFlowButtonColor
            : kDefaultBackgroundColor,
        onPressed: () {
          ref.read(chartIndexTappedProvider.notifier).state = dayRange;
          ref.read(chartDayProvider.notifier).state = dayRange;
        },
        child: Text(
          '${dayRange}D',
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
