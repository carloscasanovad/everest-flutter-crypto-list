import 'package:flutter/widgets.dart';

import '../model/market_chart_view_data.dart';
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
            dayRange: 5,
            marketChartdata: marketChartdata,
          ),
          LineChartButtonWidget(
            dayRange: 15,
            marketChartdata: marketChartdata,
          ),
          LineChartButtonWidget(
            dayRange: 30,
            marketChartdata: marketChartdata,
          ),
          LineChartButtonWidget(
            dayRange: 45,
            marketChartdata: marketChartdata,
          ),
          LineChartButtonWidget(
            dayRange: 90,
            marketChartdata: marketChartdata,
          ),
        ],
      ),
    );
  }
}
