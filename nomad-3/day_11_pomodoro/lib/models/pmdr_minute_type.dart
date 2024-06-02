enum PmdrMinuteType {
  fifteen(15),
  twenty(20),
  twentyFive(25),
  thirty(30),
  thirtyFive(35),
  ;

  final int minutes;

  const PmdrMinuteType(this.minutes);

  int get seconds => minutes * Duration.secondsPerMinute;
}
