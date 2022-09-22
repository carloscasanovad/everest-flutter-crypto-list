import 'package:flutter/widgets.dart';

import 'line_chart_button_widget.dart';

class LineChartListViewButtons extends StatelessWidget {
  const LineChartListViewButtons({
    Key? key,
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
            chartSubList: 85,
          ),
          LineChartButtonWidget(
            dayTitle: '15D',
            chartSubList: 45,
          ),
          LineChartButtonWidget(
            dayTitle: '30D',
            chartSubList: 30,
          ),
          LineChartButtonWidget(
            dayTitle: '45D',
            chartSubList: 15,
          ),
          LineChartButtonWidget(
            dayTitle: '90D',
            chartSubList: 5,
          ),
        ],
      ),
    );
  }
}
