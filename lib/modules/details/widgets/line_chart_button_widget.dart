import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../model/market_chart_view_data.dart';
import '../providers/providers.dart';

class LineChartButtonWidget extends HookConsumerWidget {
  int dayRange;
  MarketChartViewData marketChartdata;
  LineChartButtonWidget({
    required this.dayRange,
    required this.marketChartdata,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int chartIndexTapped = ref.watch(chartIndexTappedProvider);
    int marketChartLength = marketChartdata.prices.length;
    int chartSubList = marketChartLength - dayRange - 1;
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
        color: chartIndexTapped == chartSubList
            ? kDefaultFlowButtonColor
            : kDefaultBackgroundColor,
        onPressed: () {
          ref.read(chartIndexTappedProvider.notifier).state = chartSubList;
          ref.read(chartDayProvider.notifier).state = chartSubList;
          ref.read(cryptoPriceProvider.notifier).state =
              marketChartdata.prices[chartSubList][1].toDouble();
        },
        child: Text(
          '${dayRange}D',
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
