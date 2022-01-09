extension FormattableDuration on Duration {
  String format() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    return "${twoDigits(inHours)}:$twoDigitMinutes";
  }

  String formatShort() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    int minutes = inMinutes.remainder(60);
    if (minutes == 0) return "$inHours Std.";
    if (inHours == 0) return "$inMinutes Min.";

    return "$inHours:${twoDigits(minutes)} Std.";
  }
}
