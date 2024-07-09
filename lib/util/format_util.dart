class FormatUtil {
  static String getPercent(double value){
    return '${(value * 100).toStringAsFixed(0)}%';
  }
  static String twoNumber(int value){
    return value.toString().padLeft(2, '0');
  }
  static String ymdStr(DateTime time){
    return '${time.year}-${twoNumber(time.month)}-${twoNumber(time.day)}';
  }
  static String doubleToStr(double value){
    return '${(value*100).toStringAsFixed(0)}%';
  }
}