import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../shared/constants/app_colors.dart';
import '../model/market_chart_view_data.dart';
import '../controllers/providers.dart';

class DetailsLineChart extends HookConsumerWidget {
  MarketChartViewData marketChartData;
  DetailsLineChart({
    required this.marketChartData,
  });

  final formater = NumberFormat("#,##0.00", "pt");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<List<num>> spots = marketChartData.prices;
    int marketChartDay = spots.length - ref.watch(chartDayProvider);
    double selectedDayPrice = spots[marketChartDay][1].toDouble();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'R\$ ${formater.format(selectedDayPrice)}',
          style: const TextStyle(
            fontSize: 32,
            color: kDefaultBlack,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: MediaQuery.of(context).size.width,
          height: 140,
          child: LineChart(
            LineChartData(
              titlesData: FlTitlesData(
                show: false,
              ),
              backgroundColor: kDefaultBackgroundColor,
              gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: const Color(0xff37434d),
                    strokeWidth: 1,
                  );
                },
                //Remove as linhas do eixo X e Y do gráfico
                drawVerticalLine: false,
                drawHorizontalLine: false,
              ),
              borderData: FlBorderData(
                show: true,
                // Cria a borda do gráfico
                border: Border(
                  bottom: BorderSide(
                    color: kDefaultGrey.withOpacity(0.3),
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  // Remove os pontos do gráfico
                  dotData: FlDotData(
                    show: false,
                  ),
                  // Desenha o gráfico
                  spots: spots.sublist(marketChartDay).map(
                    (point) {
                      return FlSpot(point[0].toDouble(), point[1].toDouble());
                    },
                  ).toList(),
                  isCurved: false,
                  barWidth: 3,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
