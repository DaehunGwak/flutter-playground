import 'package:faker/faker.dart';

import '../user.dart';

class SearchMockDataUtil {
  SearchMockDataUtil._();

  static List<User> getMockUsers() {
    final faker = Faker();
    final List<User> users = [];

    for (var i = 0; i < 10; i++) {
      users.add(User(
        nickname: faker.internet.userName(),
        profileImageUrl: _profileImageUrl(faker),
        confirmed: true,
      ));
    }

    return users;
  }

  static String _profileImageUrl(Faker faker) {
    return faker.image.image(
      height: 50,
      width: 50,
      keywords: ['avatar', 'person', 'big_logo'],
      random: true,
    );
  }
}
