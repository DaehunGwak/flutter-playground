class UserAccount {
  String? name;
  String? email;
  DateTime? birthday;

  UserAccount({
    this.name,
    this.email,
    this.birthday,
  });

  bool isValid() {
    return isNameValid() && isEmailValid() && isBirthdayValid();
  }

  bool isNameValid() {
    return name?.isNotEmpty ?? false;
  }

  bool isEmailValid() {
    if (email == null || email!.isEmpty) {
      return false;
    }
    final regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regExp.hasMatch(email!);
  }

  bool isBirthdayValid() {
    return birthday != null;
  }

  @override
  String toString() {
    return 'UserAccount{name: $name, email: $email, birthday: $birthday}';
  }
}
