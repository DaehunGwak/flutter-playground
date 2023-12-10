class User {
  final String nickname;
  final String profileImageUrl;
  final bool confirmed;
  final String? name;
  final int flowerCount;

  User({
    required this.nickname,
    required this.profileImageUrl,
    required this.confirmed,
    this.name,
    this.flowerCount = 0,
  });
}
