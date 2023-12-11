class Activity {
  Activity({
    required this.type,
    required this.imageUrl,
    required this.title,
    String subTitle = '',
    this.content = '',
  }) : _subTitle = subTitle;

  final ActivityType type;
  final String imageUrl;
  final String title;
  final String content;
  final String _subTitle;

  static Map<ActivityType, String> typeToSubTitle = {
    ActivityType.follows: 'Followed you',
    ActivityType.mentions: 'Mentioned you',
  };

  String get subTitle {
    if (_subTitle.isNotEmpty) {
      return _subTitle;
    }
    return typeToSubTitle[type] ?? '';
  }
}

enum ActivityType {
  all,
  follows,
  replies,
  mentions,
  quotes,
  reposts,
  verified,
  like,
}
