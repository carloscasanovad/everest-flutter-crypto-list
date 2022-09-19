import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/constants/app_colors.dart';
import '../providers/providers.dart';

class LineChartButtonWidget extends HookConsumerWidget {
  int titleIndex;
  String dayTitle;
  LineChartButtonWidget({
    required this.titleIndex,
    required this.dayTitle,
  }) : super();

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
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        padding: const EdgeInsets.all(1),
        color: chartIndexTapped == titleIndex
            ? kDefaultFlowButtonColor
            : kDefaultBackgroundColor,
        onPressed: () {
          ref.read(chartIndexTappedProvider.notifier).state = titleIndex;
          ref.read(chartDayProvider.notifier).state =
              dayTitle.replaceAll('D', '');
        },
        child: Text(
          dayTitle,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
