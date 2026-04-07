import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rating Karakter Anime',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const DaftarKarakterScreen(),
    );
  }
}

class Karakter {
  final String nama;
  final String asalAnime;
  final String gender;
  final String pathFotoLocal;
  int rating;

  Karakter({
    required this.nama,
    required this.asalAnime,
    required this.gender,
    required this.pathFotoLocal,
    this.rating = 0,
  });
}

class DaftarKarakterScreen extends StatefulWidget {
  const DaftarKarakterScreen({Key? key}) : super(key: key);

  @override
  State<DaftarKarakterScreen> createState() => _DaftarKarakterScreenState();
}

class _DaftarKarakterScreenState extends State<DaftarKarakterScreen> {
  final List<Karakter> daftarKarakter = [
    Karakter(
      nama: "Asuna",
      asalAnime: "Swort art online",
      gender: "Female",
      pathFotoLocal: "assets/images/asuna.jpeg",
      rating: 5,
    ),
    Karakter(
      nama: "Lelouch Lamperouge",
      asalAnime: "Code Geass",
      gender: "Male",
      pathFotoLocal: "assets/images/Lelouch.jpeg",
      rating: 5,
    ),
    Karakter(
      nama: "Luffy Monkey D.",
      asalAnime: "One Piece",
      gender: "Male",
      pathFotoLocal: "assets/images/Luffy.jpg",
      rating: 5,
    ),
    Karakter(
      nama: "Levi Ackerman",
      asalAnime: "Attack on Titan",
      gender: "Male",
      pathFotoLocal: "assets/images/Levi.jpg",
      rating: 5,
    ),
    Karakter(
      nama: "L Lawliet",
      asalAnime: "Death Note",
      gender: "Male",
      pathFotoLocal: "assets/images/Lawliet.jpg",
      rating: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Anime Characters'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: daftarKarakter.length,
        itemBuilder: (context, index) {
          return CharacterCard(karakter: daftarKarakter[index]);
        },
      ),
    );
  }
}

class CharacterCard extends StatefulWidget {
  final Karakter karakter;

  const CharacterCard({Key? key, required this.karakter}) : super(key: key);

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  void _setRating(int newRating) {
    setState(() {
      widget.karakter.rating = newRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.deepPurple.shade800, width: 2.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.deepPurple.shade800, width: 2),
              image: DecorationImage(
                image: AssetImage(widget.karakter.pathFotoLocal),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16.0),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.karakter.nama,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  widget.karakter.asalAnime,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(height: 2.0),
                Text(
                  widget.karakter.gender,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(height: 8.0),

                Row(
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        _setRating(index + 1);
                      },
                      child: Icon(
                        index < widget.karakter.rating
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                        size: 32.0,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
