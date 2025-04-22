import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class Movie {
  final String title;
  final String imageUrl;

  Movie({required this.title, required this.imageUrl});
}

class HomePage extends StatelessWidget {
  final List<Movie> newlyReleased = List.generate(
    6,
    (index) => Movie(
      title: "Mr. Robot",
      imageUrl: "https://upload.wikimedia.org/wikipedia/en/b/b9/Mr._Robot_season_1.jpg",
    ),
  );

  final List<Movie> series = List.generate(
    6,
    (index) => Movie(
      title: "Mr. Robot",
      imageUrl: "https://upload.wikimedia.org/wikipedia/en/b/b9/Mr._Robot_season_1.jpg",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Series'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Newly Released Episodes"),
              _buildHorizontalList(newlyReleased),
              _buildSectionTitle("Series"),
              _buildHorizontalList(series),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.red,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildHorizontalList(List<Movie> movies) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return _buildMovieCard(movies[index]);
        },
      ),
    );
  }

  Widget _buildMovieCard(Movie movie) {
    return Container(
      width: 130,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(movie.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
