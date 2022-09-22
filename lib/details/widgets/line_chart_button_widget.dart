import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/api/market_chart/viewData/market_chart_view_data.dart';
import '../../shared/constants/app_colors.dart';
import '../providers/providers.dart';

class LineChartButtonWidget extends HookConsumerWidget {
  int chartSubList;
  String dayTitle;
  MarketChartViewData marketChartdata;
  LineChartButtonWidget({
    required this.chartSubList,
    required this.dayTitle,
    required this.marketChartdata,
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
          dayTitle,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
