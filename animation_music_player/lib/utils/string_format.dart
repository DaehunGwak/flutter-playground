String formattedTime(Duration duration) {
  final formattedMinute = duration.inMinutes.toString().padLeft(2, '0');
  final formattedSeconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
  return "$formattedMinute:$formattedSeconds";
}
