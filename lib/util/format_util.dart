class FormatUtil {
  static String getPercent(double value){
    return '${(value * 100).toStringAsFixed(0)}%';
  }
}