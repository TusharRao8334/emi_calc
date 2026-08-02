import 'package:emi_calc/core/utils/currency_formatter.dart';
import 'package:emi_calc/features/emi/model/emi_result.dart';
import 'package:emi_calc/features/emi/widgets/summary_tile.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final EmiResult result;

  const ResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text('Monthly EMI', style: Theme.of(context).textTheme.titleMedium),

            const SizedBox(height: 12),

            Text(
              CurrencyFormatter.format(result.monthlyEmi),
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            SummaryTile(
              title: 'Principal',
              value: CurrencyFormatter.format(result.principal),
              icon: Icons.account_balance_wallet_outlined,
              iconColor: Colors.blue,
            ),

            const SizedBox(height: 12),

            SummaryTile(
              title: 'Interest',
              value: CurrencyFormatter.format(result.totalInterest),
              icon: Icons.trending_up,
              iconColor: Colors.orange,
            ),

            const SizedBox(height: 12),

            SummaryTile(
              title: 'Total Payment',
              value: CurrencyFormatter.format(result.totalPayment),
              icon: Icons.payments_outlined,
              iconColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
