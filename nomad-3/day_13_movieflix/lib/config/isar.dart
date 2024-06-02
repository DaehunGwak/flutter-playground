import 'package:day_13_movieflix/models/movie_like.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

abstract class IsarConfig {
  static Isar? _instance;

  static Isar get instance {
    return _instance!;
  }

  static loadInstance() async {
    final dir = await getApplicationDocumentsDirectory();
    _instance = await Isar.open(
      [MovieLikeSchema],
      directory: dir.path,
    );
  }
}
