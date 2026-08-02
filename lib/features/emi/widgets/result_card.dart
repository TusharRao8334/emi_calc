import 'package:emi_calc/core/utils/currency_formatter.dart';
import 'package:emi_calc/features/emi/model/emi_result.dart';
import 'package:emi_calc/features/emi/widgets/summary_tile.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final EmiResult result;

  const ResultCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorScheme.primary, colorScheme.primaryContainer],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.account_balance_wallet_rounded,
                  color: Colors.white,
                  size: 40,
                ),

                const SizedBox(height: 12),

                const Text(
                  'Monthly EMI',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),

                const SizedBox(height: 8),

                Text(
                  CurrencyFormatter.format(result.monthlyEmi),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SummaryTile(
                  title: 'Principal',
                  value: CurrencyFormatter.format(result.principal),
                  icon: Icons.account_balance_wallet_outlined,
                  iconColor: Colors.green,
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
                  iconColor: colorScheme.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
