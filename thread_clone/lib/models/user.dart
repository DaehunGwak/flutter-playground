class User {
  final String nickname;
  final String profileImageUrl;
  final bool confirmed;
  final String? name;
  final int followerCount;

  User({
    required this.nickname,
    required this.profileImageUrl,
    required this.confirmed,
    this.name,
    this.followerCount = 0,
  });

  String get formattedFollowerCount {
    if (followerCount >= 1000000) {
      return _extractMCount();
    }
    if (followerCount >= 1000) {
      return _extractKCount();
    }
    return '$followerCount';
  }

  String _extractMCount() {
    final kCount = followerCount ~/ 1000000;
    final restDotCount = followerCount % 1000000 ~/ 100000;
    if (restDotCount > 0) {
      return '$kCount.${restDotCount}M';
    }
    return '${followerCount ~/ 1000000}M';
  }

  String _extractKCount() {
    final kCount = followerCount ~/ 1000;
    final restDotCount = followerCount % 1000 ~/ 100;
    if (restDotCount > 0) {
      return '$kCount.${restDotCount}K';
    }
    return '${followerCount ~/ 1000}K';
  }
}
