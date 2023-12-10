import 'package:faker/faker.dart';

import '../activity.dart';

class ActivityMockDataUtil {
  ActivityMockDataUtil._();

  static List<Activity> getActivities() {
    final faker = Faker();
    final userImageUrl = _profileImageUrl(faker);
    final plantImageUrl = _profileImageUrl(faker);
    return [
      Activity(
        type: ActivityType.mentions,
        imageUrl: userImageUrl,
        title: 'john_mobbin',
        content:
            "Here's thread you should follow if you love botany @jane_mobbin",
      ),
      Activity(
        type: ActivityType.replies,
        imageUrl: userImageUrl,
        title: 'john_mobbin',
        content: 'Count me in!',
      ),
      Activity(
        type: ActivityType.follows,
        imageUrl: plantImageUrl,
        title: 'the.plantdads',
      ),
      Activity(
        type: ActivityType.like,
        imageUrl: plantImageUrl,
        title: 'the.plantdads',
        subTitle: 'Definitely broken! 🧵👀🌱',
      ),
      Activity(
        type: ActivityType.like,
        imageUrl: _profileImageUrl(faker),
        title: 'theberryjungle',
        subTitle: '🧵👀🌱',
      ),
    ];
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
