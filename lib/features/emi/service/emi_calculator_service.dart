import 'dart:math';

import 'package:emi_calc/features/emi/model/emi_result.dart';

class EmiCalculatorService {
  const EmiCalculatorService._();

  static EmiResult calculate({
    required double principal,
    required double annualInterestRate,
    required double tenureYears,
  }) {
    // Convert years to months
    final totalMonths = (tenureYears * 12).round();

    // Monthly interest rate
    final monthlyRate = annualInterestRate / 12 / 100;

    // Handle 0% interest separately
    if (monthlyRate == 0) {
      final emi = principal / totalMonths;

      return EmiResult(
        monthlyEmi: emi,
        principal: principal,
        totalInterest: 0,
        totalPayment: principal,
      );
    }

    final factor = pow(1 + monthlyRate, totalMonths).toDouble();

    final emi = principal * monthlyRate * factor / (factor - 1);

    final totalPayment = emi * totalMonths;

    final totalInterest = totalPayment - principal;

    return EmiResult(
      monthlyEmi: emi,
      principal: principal,
      totalInterest: totalInterest,
      totalPayment: totalPayment,
    );
  }
}
