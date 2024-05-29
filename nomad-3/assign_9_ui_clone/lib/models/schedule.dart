class Schedule {
  final String title;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final List<String> participants;

  Schedule({
    required this.title,
    required this.startDateTime,
    required this.endDateTime,
    required this.participants,
  });
}
