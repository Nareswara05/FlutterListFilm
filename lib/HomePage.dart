import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Super_Cinemas/Model.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Cinemas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Movie> favoriteMovies = [];
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    fetchMovies().then((movies) {
      setState(() {
        favoriteMovies = movies;
        isLoading = false;
      });
    });
  }

  Future<List<Movie>> fetchMovies() async {
    final apiKey = '9acf91f77dc8d30eea3c27a21ecd43f3';
    final url = Uri.https('api.themoviedb.org', '/3/movie/popular', {
      'api_key': apiKey,
    });
    await Future.delayed(Duration(seconds: 2));
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Movie> movies = [];
      for (var movieData in data['results']) {
        Movie movie = Movie(
          title: movieData['title'],
          posterUrl: 'https://image.tmdb.org/t/p/w500/${movieData['poster_path']}',
          genre: getGenreNames(movieData['genre_ids']),
          rating: movieData['vote_average'].toDouble(),
          releaseYear: int.parse(movieData['release_date'].split('-')[0]),
        );
        movies.add(movie);
      }
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  String getGenreNames(List<dynamic> genreIds) {
    Map<int, String> genreMap = {
      28: "Action",
      35: "Comedy",
      80: "Crime",
      18: "Drama",
      14: "Fantasy",
      53: "Thriller",
      10749: "Romance",
      12: "Adventure",
      27: "Horror",
      878: "Science Fiction",
      16: "Animation",
      36: "History",
      37: "Western",
      10751: "Family",
      9648: "Mystery",

    };

    List<String> genreNames = genreIds
        .map((id) => genreMap[id] ?? 'Unknown')
        .toList();

    return genreNames.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
        child: Container(
        color: Colors.black,
            child: Stack(
                children: [
                // Show loading spinner if isLoading is true
                if (isLoading)
            Center(
            child: CircularProgressIndicator(),
        )
        else
          ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: favoriteMovies.length,
          itemBuilder: (BuildContext context, int index) {
         return Container(
              height: 160,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 2,
                //   ),
                // ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Align contents to the top
                children: [
                  Image.network(
                    favoriteMovies[index].posterUrl,
                    width: 90,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            favoriteMovies[index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "(${favoriteMovies[index].releaseYear.toString()})",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Genre: ${favoriteMovies[index].genre}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 5),
                              Text(
                                favoriteMovies[index].rating.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            );
          },
        ),
      ],
    ))));
  }
}
