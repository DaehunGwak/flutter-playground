import 'package:logger/logger.dart';

class CustomLogger {
  // static final Logger logger = Logger(
  // printer: PrettyPrinter(
  //   methodCount: 2,
  //   errorMethodCount: 5,
  //   colors: false,
  //   printEmojis: true,
  //   dateTimeFormat: DateTimeFormat.dateAndTime,
  // ),
  // printer: SimplePrinter(
  //   printTime: true,
  //   colors: false,
  // ),
  // );

  static final Logger logger = Logger(
    printer: SingleLineLogPrinter(),
  );
}

class SingleLineLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    final level = event.level.toString().split('.').last.toUpperCase();
    final emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    final time = event.time;
    final message = event.message.toString();

    final stackTrace = event.stackTrace ?? StackTrace.current;
    final caller = _extractCallerInfo(stackTrace);

    return [
      '$time $caller [$emoji$level] $message',
      if (event.level.value >= Level.error.value) stackTrace.toString(),
    ];
  }

  String _extractCallerInfo(StackTrace stackTrace) {
    final lines = stackTrace.toString().split('\n');

    // logger 패키지 호출 부분을 건너뛰기 위해 적절한 라인 찾기
    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      if (!line.contains('package:logger/') &&
          !line.contains('core/utils/logger.dart') &&
          line.contains('#')) {
        // 파일 경로와 라인 번호 추출
        final filePathMatch =
            RegExp(r'\((.+?):(\d+)(?::\d+)?\)').firstMatch(line);
        if (filePathMatch != null) {
          final filePath = filePathMatch.group(1);
          final lineNumber = filePathMatch.group(2);

          // 파일 이름만 추출 (경로 제외)
          final fileName = filePath?.split('/').last;

          return '$fileName:$lineNumber';
        }

        // 웹 스택트레이스 형식 처리
        final webMatch =
            RegExp(r'at (.+) \((.+?):(\d+)(?::\d+)?\)').firstMatch(line);
        if (webMatch != null) {
          final filePath = webMatch.group(2);
          final lineNumber = webMatch.group(3);
          final fileName = filePath?.split('/').last;

          return '$fileName:$lineNumber';
        }
      }
    }

    return 'unknown';
  }
}
