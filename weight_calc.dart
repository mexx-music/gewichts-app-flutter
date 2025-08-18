// lib/core/logic/weight_calc.dart
class WeightCalc {
  static (double a, double b) calibrate(
    double v1, double r1, double v2, double r2, {
    double optV = 0.0, double optR = 0.0,
  }) {
    if (optV > 0 && optR > 0) {
      final x = [v1, optV, v2];
      final y = [r1, optR, r2];
      final xm = (x[0] + x[1] + x[2]) / 3.0;
      final ym = (y[0] + y[1] + y[2]) / 3.0;
      final denom = x.map((xi) => (xi - xm) * (xi - xm)).reduce((a, b) => a + b);
      if (denom == 0) return (1.0, 0.0);
      final num = List.generate(3, (i) => (x[i] - xm) * (y[i] - ym)).reduce((a, b) => a + b);
      final a = num / denom;
      final b = ym - a * xm;
      return (a, b);
    } else {
      if ((v2 - v1) == 0) return (1.0, 0.0);
      final a = (r2 - r1) / (v2 - v1);
      final b = r1 - a * v1;
      return (a, b);
    }
  }
}
