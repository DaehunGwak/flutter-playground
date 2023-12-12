import 'package:faker/faker.dart';
import 'package:thread_clone/models/user.dart';

class ProfileMockDataUtil {
  ProfileMockDataUtil._();

  static User getMockUser() {
    final faker = Faker();
    return User(
      name: faker.person.name(),
      nickname: faker.internet.userName(),
      description: faker.lorem.sentence(),
      profileImageUrl: _profileImageUrl(faker),
      confirmed: false,
      followerCount: 2,
      followerImageUrls: [
        for (var i = 0; i < 2; i++)
          _profileSmallImageUrl(faker)
      ]
    );
  }

  static String _profileImageUrl(Faker faker) {
    return faker.image.image(
      height: 100,
      width: 100,
      keywords: ['avatar', 'person', 'big_logo'],
      random: true,
    );
  }

  static String _profileSmallImageUrl(Faker faker) {
    return faker.image.image(
      height: 30,
      width: 30,
      keywords: ['avatar', 'person', 'big_logo'],
      random: true,
    );
  }
}
