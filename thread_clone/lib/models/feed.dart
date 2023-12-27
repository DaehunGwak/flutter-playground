import 'package:thread_clone/write/models/thread_model.dart';

import 'user.dart';

class Feed {
  final User createdUser;
  final List<String> contentImageUrls;
  final String contentDescription;
  final List<User> replyCandidateUsers;
  final int replyCount;
  final int likeCount;
  final DateTime createdDateTime;

  Feed({
    required this.createdUser,
    this.contentImageUrls = const [],
    required this.contentDescription,
    this.replyCandidateUsers = const [],
    this.replyCount = 0,
    this.likeCount = 0,
    required this.createdDateTime,
  });

  factory Feed.fromThread(ThreadModel thread) => Feed(
        createdUser: User(
          nickname: thread.userName,
          profileImageUrl: '',
          confirmed: false,
        ),
        contentImageUrls: thread.imageUrls,
        contentDescription: thread.content,
        createdDateTime:
            DateTime.fromMillisecondsSinceEpoch(thread.createdTime),
      );

  String get formattedPassedTime {
    final passedDuration = Duration(
        milliseconds: DateTime.now().millisecondsSinceEpoch -
            createdDateTime.millisecondsSinceEpoch);
    if (passedDuration.inDays > 0) {
      return "${passedDuration.inDays}d";
    }
    if (passedDuration.inHours > 0) {
      return "${passedDuration.inHours}h";
    }
    if (passedDuration.inMinutes > 0) {
      return "${passedDuration.inMinutes}m";
    }
    return "now";
  }
}
