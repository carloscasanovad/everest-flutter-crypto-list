import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:everest_flutter_crypto_list/shared/api/crypto_data/viewData/crypto_data_view_data.dart';

import '../../shared/api/market_chart/viewData/market_chart_view_data.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/providers/providers.dart';
import '../providers/providers.dart';
import 'line_chart_list_view_buttons.dart';

class DetailsLineChart extends ConsumerStatefulWidget {
  DetailsLineChart({super.key});

  @override
  ConsumerState<DetailsLineChart> createState() => _DetailsLineChartState();
}

final formater = NumberFormat("#,##0.00", "pt");

class _DetailsLineChartState extends ConsumerState<DetailsLineChart> {
  @override
  Widget build(BuildContext context) {
    int marketChartDay = ref.watch(chartDayProvider);
    String crypto = ref.watch(cryptoChartProvider);

    double currentPrice = ref.watch(cryptoPriceProvider);
    return FutureBuilder(
      future: ref.watch(marketChartDataProvider(crypto).future),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          MarketChartViewData marketChart = snapshot.data!;
          List<List<num>> spots = marketChart.prices;
          ref.read(marketChartPricesProvider.notifier).state = marketChart;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'R\$ ${formater.format(currentPrice)}',
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
                    // minX: 0,
                    // minY: 0,
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
                            return FlSpot(
                                point[0].toDouble(), point[1].toDouble());
                          },
                        ).toList(),
                        isCurved: false,
                        barWidth: 3,
                      ),
                    ],
                  ),
                ),
              ),
              const LineChartListViewButtons(),
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    );
    ;
  }
}
