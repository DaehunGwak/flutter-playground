abstract class HeroTagBuilder {
  static const String _prefixImage = 'image';

  static String buildImageTag(String middle, int id) => '$_prefixImage-$middle-$id';
}
