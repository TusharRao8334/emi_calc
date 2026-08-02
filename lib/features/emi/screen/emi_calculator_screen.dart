import 'package:emi_calc/core/utils/currency_formatter.dart';
import 'package:emi_calc/features/emi/model/emi_result.dart';
import 'package:emi_calc/features/emi/service/emi_calculator_service.dart';
import 'package:emi_calc/features/emi/widgets/amount_slider.dart';
import 'package:emi_calc/features/emi/widgets/pie_chart_widget.dart';
import 'package:emi_calc/features/emi/widgets/result_card.dart';
import 'package:flutter/material.dart';

class EmiCalculatorScreen extends StatefulWidget {
  const EmiCalculatorScreen({super.key});

  @override
  State<EmiCalculatorScreen> createState() => _EmiCalculatorScreenState();
}

class _EmiCalculatorScreenState extends State<EmiCalculatorScreen> {
  double loanAmount = 1000000;
  double interestRate = 8.5;
  double tenure = 20;

  EmiResult result = EmiResult.empty();

  @override
  void initState() {
    super.initState();
    _calculate();
  }

  void _calculate() {
    result = EmiCalculatorService.calculate(
      principal: loanAmount,
      annualInterestRate: interestRate,
      tenureYears: tenure,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EMI Calculator')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ResultCard(result: result),

          const SizedBox(height: 20),

          AmountSlider(
            title: 'Loan Amount',
            value: CurrencyFormatter.format(loanAmount),
            sliderValue: loanAmount,
            min: 50000,
            max: 10000000,
            divisions: 199,
            onChanged: (value) {
              loanAmount = value;
              _calculate();
            },
          ),

          const SizedBox(height: 16),

          AmountSlider(
            title: 'Interest Rate',
            value: '${interestRate.toStringAsFixed(1)} %',
            sliderValue: interestRate,
            min: 1,
            max: 20,
            divisions: 190,
            onChanged: (value) {
              interestRate = value;
              _calculate();
            },
          ),

          const SizedBox(height: 16),

          AmountSlider(
            title: 'Loan Tenure',
            value: '${tenure.toStringAsFixed(0)} Years',
            sliderValue: tenure,
            min: 1,
            max: 30,
            divisions: 29,
            onChanged: (value) {
              tenure = value;
              _calculate();
            },
          ),

          const SizedBox(height: 24),

          PieChartWidget(
            principal: result.principal,
            interest: result.totalInterest,
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
