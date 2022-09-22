import 'package:flutter/widgets.dart';

import '../../shared/api/market_chart/viewData/market_chart_view_data.dart';
import 'line_chart_button_widget.dart';

class LineChartListViewButtons extends StatelessWidget {
  MarketChartViewData marketChartdata;
  LineChartListViewButtons({
    Key? key,
    required this.marketChartdata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          LineChartButtonWidget(
            dayTitle: '5D',
            chartSubList: 84,
            marketChartdata: marketChartdata,
          ),
          LineChartButtonWidget(
            dayTitle: '15D',
            chartSubList: 44,
            marketChartdata: marketChartdata,
          ),
          LineChartButtonWidget(
            dayTitle: '30D',
            chartSubList: 29,
            marketChartdata: marketChartdata,
          ),
          LineChartButtonWidget(
            dayTitle: '45D',
            chartSubList: 14,
            marketChartdata: marketChartdata,
          ),
          LineChartButtonWidget(
            dayTitle: '90D',
            chartSubList: 4,
            marketChartdata: marketChartdata,
          ),
        ],
      ),
    );
  }
}
