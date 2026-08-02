class EmiResult {
  final double monthlyEmi;
  final double principal;
  final double totalInterest;
  final double totalPayment;

  const EmiResult({
    required this.monthlyEmi,
    required this.principal,
    required this.totalInterest,
    required this.totalPayment,
  });

  factory EmiResult.empty() {
    return const EmiResult(
      monthlyEmi: 0,
      principal: 0,
      totalInterest: 0,
      totalPayment: 0,
    );
  }
}
