class TrackModel {
  TrackModel({
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.runtime,
  });

  final String title;
  final String artist;
  final String imageUrl;
  final Duration runtime;

  String createTag() => "$artist-$title";
}

class MusicModelFactory {
  MusicModelFactory._();

  static List<TrackModel> createMusics() {
    return [
      TrackModel(
        title: 'Glitter',
        artist: 'BENEE',
        imageUrl:
            'https://musicmeta-phinf.pstatic.net/album/003/074/3074973.jpg?type=r480Fll&v=20230331153048',
        runtime: const Duration(minutes: 3, seconds: 0),
      ),
      TrackModel(
        title: 'Reflection Eternal',
        artist: 'Nujabes',
        imageUrl:
            'https://musicmeta-phinf.pstatic.net/album/006/471/6471594.jpg?type=r480Fll&v=20230307004926',
        runtime: const Duration(minutes: 4, seconds: 20),
      ),
      TrackModel(
        title: 'Jasmine (Demo)',
        artist: 'Jai Paul',
        imageUrl:
            'https://musicmeta-phinf.pstatic.net/album/003/064/3064669.jpg?type=r480Fll&v=20240114081007',
        runtime: const Duration(minutes: 4, seconds: 13),
      ),
      TrackModel(
        title: 'Trippy (Feat. Lance Skiiiwalker)',
        artist: 'Beenzino',
        imageUrl:
            'https://musicmeta-phinf.pstatic.net/album/010/027/10027840.jpg?type=r480Fll&v=20230703171400',
        runtime: const Duration(minutes: 4, seconds: 37),
      ),
    ];
  }
}
