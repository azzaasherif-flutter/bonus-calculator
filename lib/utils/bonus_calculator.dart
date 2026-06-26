import '../models/performance_rating.dart';

class BonusCalculator {
  static double annualSalary(double monthly) => monthly * 12;

  static double bonusAmount(double monthly, PerformanceRating rating) =>
      annualSalary(monthly) * rating.percentage;

  static double totalAmount(double monthly, PerformanceRating rating) =>
      annualSalary(monthly) + bonusAmount(monthly, rating);

  static String format(double value) {
    if (value == 0) return '0';
    final parts = value.toStringAsFixed(2).split('.');
    final intPart = parts[0].replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return parts[1] == '00' ? intPart : '$intPart.${parts[1]}';
  }
}
