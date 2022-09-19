import 'package:flutter/widgets.dart';

import 'line_chart_button_widget.dart';

class LineChartListViewButtons extends StatelessWidget {
  const LineChartListViewButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          LineChartButtonWidget(
            dayTitle: '5D',
            titleIndex: 0,
          ),
          LineChartButtonWidget(
            dayTitle: '15D',
            titleIndex: 1,
          ),
          LineChartButtonWidget(
            dayTitle: '30D',
            titleIndex: 2,
          ),
          LineChartButtonWidget(
            dayTitle: '45D',
            titleIndex: 3,
          ),
          LineChartButtonWidget(
            dayTitle: '90D',
            titleIndex: 4,
          ),
        ],
      ),
    );
  }
}
