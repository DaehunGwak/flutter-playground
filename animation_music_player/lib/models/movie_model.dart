class TrackModel {
  TrackModel({
    required this.title,
    required this.artist,
    required this.imageUrl,
  });

  final String title;
  final String artist;
  final String imageUrl;
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
      ),
      TrackModel(
        title: 'Reflection Eternal',
        artist: 'Nujabes',
        imageUrl:
            'https://musicmeta-phinf.pstatic.net/album/006/471/6471594.jpg?type=r480Fll&v=20230307004926',
      ),
      TrackModel(
        title: 'Jasmine (Demo)',
        artist: 'Jai Paul',
        imageUrl:
            'https://musicmeta-phinf.pstatic.net/album/003/064/3064669.jpg?type=r480Fll&v=20240114081007',
      ),
    ];
  }
}
