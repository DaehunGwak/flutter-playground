import 'package:faker/faker.dart';

class WriteMockDataUtil {
  WriteMockDataUtil._();

  static String profileImageUrl() {
    return Faker().image.image(
      height: 50,
      width: 50,
      keywords: ['avatar', 'person', 'big_logo'],
      random: true,
    );
  }

  static String username() {
    return Faker().internet.userName();
  }
}