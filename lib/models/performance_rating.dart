enum PerformanceRating { excellent, veryGood, good }

extension PerformanceRatingX on PerformanceRating {
  String get label {
    switch (this) {
      case PerformanceRating.excellent:
        return 'ممتاز';
      case PerformanceRating.veryGood:
        return 'جيد جداً';
      case PerformanceRating.good:
        return 'جيد';
    }
  }

  double get percentage {
    switch (this) {
      case PerformanceRating.excellent:
        return 0.15;
      case PerformanceRating.veryGood:
        return 0.10;
      case PerformanceRating.good:
        return 0.05;
    }
  }

  String get percentageLabel => '${(percentage * 100).toInt()}%';

  String get fullLabel => '$label ($percentageLabel)';
}
