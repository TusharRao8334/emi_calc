import 'package:emi_calc/core/utils/currency_formatter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatefulWidget {
  final double principal;
  final double interest;

  const PieChartWidget({
    super.key,
    required this.principal,
    required this.interest,
  });

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final total = widget.principal + widget.interest;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Loan Breakdown',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 250,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                      sectionsSpace: 3,
                      centerSpaceRadius: 70,
                      pieTouchData: PieTouchData(
                        touchCallback: (event, response) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                response == null ||
                                response.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }

                            touchedIndex =
                                response.touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      sections: [
                        PieChartSectionData(
                          color: Colors.green,
                          value: widget.principal,
                          radius: touchedIndex == 0 ? 68 : 58,
                          title:
                              '${((widget.principal / total) * 100).toStringAsFixed(1)}%',
                          titleStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        PieChartSectionData(
                          color: Colors.orange,
                          value: widget.interest,
                          radius: touchedIndex == 1 ? 68 : 58,
                          title:
                              '${((widget.interest / total) * 100).toStringAsFixed(1)}%',
                          titleStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        CurrencyFormatter.format(total),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _legend(context, Colors.green, 'Principal', widget.principal),

            const SizedBox(height: 12),

            _legend(context, Colors.orange, 'Interest', widget.interest),
          ],
        ),
      ),
    );
  }

  Widget _legend(
    BuildContext context,
    Color color,
    String title,
    double amount,
  ) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),

        Text(
          CurrencyFormatter.format(amount),
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
