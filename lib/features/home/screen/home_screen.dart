import 'package:emi_calc/features/emi/screen/emi_calculator_screen.dart';
import 'package:emi_calc/shared/widgets/calculator_card.dart';
import 'package:emi_calc/shared/widgets/dashboard_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EMI Calc',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const DashboardHeader(),

            const SizedBox(height: 30),

            Text(
              'Calculators',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 18),

            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: .95,
              children: [
                CalculatorCard(
                  title: 'EMI',
                  icon: Icons.calculate,
                  color: Colors.green,
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const EmiCalculatorScreen(),
                      ),
                    );
                  },
                ),
                CalculatorCard(
                  title: 'SIP',
                  icon: Icons.trending_up,
                  color: Colors.blue,
                ),
                CalculatorCard(
                  title: 'FD',
                  icon: Icons.account_balance,
                  color: Colors.orange,
                ),
                CalculatorCard(
                  title: 'RD',
                  icon: Icons.savings,
                  color: Colors.purple,
                ),
                CalculatorCard(
                  title: 'PPF',
                  icon: Icons.currency_rupee,
                  color: Colors.red,
                ),
                CalculatorCard(
                  title: 'GST',
                  icon: Icons.receipt_long,
                  color: Colors.teal,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          NavigationDestination(icon: Icon(Icons.history), label: 'History'),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
