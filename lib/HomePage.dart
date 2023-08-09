import 'package:flutter/material.dart';
import 'package:day1/model.dart';
import 'package:day1/HomePage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
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

  @override
  void initState() {
    super.initState();
    Movie movie1 = Movie(
      title: "Deadpool",
      posterUrl: "https://cdns.klimg.com/resized/670x/g/f/o/foto_superhero_edan_poster_deadpool_ini_bikin_ngakak_abis/p/-20160210-009-rita.jpg",
      genre: "Action",
      rating: 4,
      releaseYear: 2022,
    );
    Movie movie2 = Movie(
      title: "Movie 2",
      posterUrl: "https://cdns.klimg.com/resized/670x/g/f/o/foto_superhero_edan_poster_deadpool_ini_bikin_ngakak_abis/p/-20160210-009-rita.jpg",
      genre: "Comedy",
      rating: 5,
      releaseYear: 2019,
    );
    Movie movie3 = Movie(
      title: "Movie 2",
      posterUrl: "https://cdns.klimg.com/resized/670x/g/f/o/foto_superhero_edan_poster_deadpool_ini_bikin_ngakak_abis/p/-20160210-009-rita.jpg",
      genre: "Comedy",
      rating: 5,
      releaseYear: 2019,
    );
    Movie movie4 = Movie(
      title: "Movie 2",
      posterUrl: "https://cdns.klimg.com/resized/670x/g/f/o/foto_superhero_edan_poster_deadpool_ini_bikin_ngakak_abis/p/-20160210-009-rita.jpg",
      genre: "Comedy",
      rating: 5,
      releaseYear: 2019,
    );
    Movie movie5 = Movie(
      title: "Movie 2",
      posterUrl: "https://cdns.klimg.com/resized/670x/g/f/o/foto_superhero_edan_poster_deadpool_ini_bikin_ngakak_abis/p/-20160210-009-rita.jpg",
      genre: "Comedy",
      rating: 5,
      releaseYear: 2019,
    );
    Movie movie6 = Movie(
      title: "Movie 2",
      posterUrl: "https://cdns.klimg.com/resized/670x/g/f/o/foto_superhero_edan_poster_deadpool_ini_bikin_ngakak_abis/p/-20160210-009-rita.jpg",
      genre: "Comedy",
      rating: 5,
      releaseYear: 2019,
    );
    Movie movie7 = Movie(
      title: "Movie 2",
      posterUrl: "https://cdns.klimg.com/resized/670x/g/f/o/foto_superhero_edan_poster_deadpool_ini_bikin_ngakak_abis/p/-20160210-009-rita.jpg",
      genre: "Comedy",
      rating: 3,
      releaseYear: 2019,
    );
    Movie movie8 = Movie(
      title: "Movie 2",
      posterUrl: "https://cdns.klimg.com/resized/670x/g/f/o/foto_superhero_edan_poster_deadpool_ini_bikin_ngakak_abis/p/-20160210-009-rita.jpg",
      genre: "Comedy",
      rating: 5,
      releaseYear: 2019,
    );



    favoriteMovies.add(movie1);
    favoriteMovies.add(movie2);
    favoriteMovies.add(movie3);
    favoriteMovies.add(movie4);
    favoriteMovies.add(movie5);
    favoriteMovies.add(movie6);
    favoriteMovies.add(movie7);
    favoriteMovies.add(movie8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: favoriteMovies.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 140,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                      )
                    ]
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      favoriteMovies[index].posterUrl,
                      width: 70,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Text(
                                favoriteMovies[index].title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "(${favoriteMovies[index].releaseYear.toString()})",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          )),
                          Text(
                            "Genre: ${favoriteMovies[index].genre}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          Row(
                            children: List.generate(
                              favoriteMovies[index].rating,
                                  (ratingIndex) =>
                                      Icon(
                                          Icons.star,
                                          color: Colors.orange
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
