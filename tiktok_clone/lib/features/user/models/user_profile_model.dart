class UserProfileModel {
  UserProfileModel({
    required this.uid,
    required this.name,
    required this.email,
    this.bio = "",
    this.link = "",
  });

  final String uid;
  final String name;
  final String email;
  final String bio;
  final String link;

  UserProfileModel.empty()
      : this(
          uid: "",
          name: "",
          email: "",
        );

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "bio": bio,
      "link": link,
    };
  }
}
