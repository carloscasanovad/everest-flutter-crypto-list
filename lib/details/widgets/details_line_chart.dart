import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/model/crypto_list_model.dart';
import '../providers/providers.dart';

class DetailsLineChart extends HookConsumerWidget {
  DetailsLineChart({
    Key? key,
    required this.dataCrypto,
  }) : super(key: key);

  final CryptoListModel dataCrypto;
  final formater = NumberFormat("#,##0.00", "pt");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int chartIndex = ref.watch(chartIndexTappedProvider);
    double cryptoValue =
        dataCrypto.marketHistoryPrice.values.toList()[chartIndex];
    List points = dataCrypto.marketPriceUpnDown.values.toList()[chartIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'R\$ ${formater.format(cryptoValue)}',
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
              minX: 0,
              minY: 0,
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
                  spots: points
                      .map(
                        (point) => FlSpot(point[0], point[1]),
                      )
                      .toList(),
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

