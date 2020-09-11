import 'package:flutter/material.dart';
import 'package:ful2fun/models/song.dart';

class MusicSearchPage extends StatefulWidget {
  @override
  _MusicSearchPageState createState() => _MusicSearchPageState();
}

final List<Song> songList = [
  Song(
    albumName: 'Main Tumhara - Dil Bechara',
    singerName: 'A.R Rahman',
    imageUrl:
        'https://nenow.in/wp-content/uploads/2020/06/Story-9-11-scaled-1200x675.jpg',
    songName: 'Main Tumhara',
  ),
  Song(
    albumName: 'Main Tumhara - Dil Bechara',
    singerName: 'A.R Rahman',
    imageUrl:
        'https://nenow.in/wp-content/uploads/2020/06/Story-9-11-scaled-1200x675.jpg',
    songName: 'Main Tumhara',
  ),
  Song(
    albumName: 'Main Tumhara - Dil Bechara',
    singerName: 'A.R Rahman',
    imageUrl:
        'https://nenow.in/wp-content/uploads/2020/06/Story-9-11-scaled-1200x675.jpg',
    songName: 'Main Tumhara',
  ),
  Song(
    albumName: 'Main Tumhara - Dil Bechara',
    singerName: 'A.R Rahman',
    imageUrl:
        'https://nenow.in/wp-content/uploads/2020/06/Story-9-11-scaled-1200x675.jpg',
    songName: 'Main Tumhara',
  ),
  Song(
    albumName: 'Main Tumhara - Dil Bechara',
    singerName: 'A.R Rahman',
    imageUrl:
        'https://nenow.in/wp-content/uploads/2020/06/Story-9-11-scaled-1200x675.jpg',
    songName: 'Main Tumhara',
  ),
  Song(
    albumName: 'Main Tumhara - Dil Bechara',
    singerName: 'A.R Rahman',
    imageUrl:
        'https://nenow.in/wp-content/uploads/2020/06/Story-9-11-scaled-1200x675.jpg',
    songName: 'Main Tumhara',
  ),
  Song(
    albumName: 'Main Tumhara - Dil Bechara',
    singerName: 'A.R Rahman',
    imageUrl:
        'https://nenow.in/wp-content/uploads/2020/06/Story-9-11-scaled-1200x675.jpg',
    songName: 'Main Tumhara',
  ),
  Song(
    albumName: 'Main Tumhara - Dil Bechara',
    singerName: 'A.R Rahman',
    imageUrl:
        'https://nenow.in/wp-content/uploads/2020/06/Story-9-11-scaled-1200x675.jpg',
    songName: 'Main Tumhara',
  ),
];

searchBar(Size size) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    height: 45,
    width: size.width * 0.9,
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20)),
    child: TextField(
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: 'Search Music',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: InputBorder.none,
      ),
    ),
  );
}

songSuggestions() {
  return ListView.builder(
    itemBuilder: (context, index) {
      final Song song = songList[index];
      return _SongContainer(
        song: song,
      );
    },
    itemCount: songList.length,
  );
}

class _MusicSearchPageState extends State<MusicSearchPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Select a background music',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            searchBar(size),
            SizedBox(
              height: 20,
            ),
            Expanded(child: songSuggestions()),
          ],
        ),
      ),
    );
  }
}

class _SongContainer extends StatelessWidget {
  final Song song;

  const _SongContainer({this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      child: ListTile(
        leading: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white),
          ),
          child: FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: 'images/musicplaceholder.png',
            image: song.imageUrl,
          ),
        ),
        title: Text(
          song.albumName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(
            song.songName,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
