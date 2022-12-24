import 'package:flutter/material.dart';
import 'package:themoviedb/controllers/movie_controller.dart';
import 'package:themoviedb/models/movie.dart';
import 'package:themoviedb/widgets/custom_navigation_bar.dart';
import 'package:themoviedb/pages/movie_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  final MovieController movieController = MovieController();

  String searchFieldValue = "";
  List<Movie> listMovie = [];

  Widget movieCard() {
    if (searchFieldValue.isEmpty) {
      return const Text('');
    }
    if (listMovie.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(5),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            for (var movie in listMovie)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => MoviePage(movie: movie))));
                  },
                  child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 29, 29, 30),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 33, 33, 35)
                                .withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w342/${movie.posterPath}',
                            height: 70,
                            width: 50,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Image.asset("../../images/claquete.png"),
                            errorWidget: (context, url, error) =>
                                Image.asset("../../images/claquete.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movie.originalTitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ),
          ],
        ),
      );
    }

    return const Padding(
      padding: EdgeInsets.all(50),
      child: Text(
        "Poxa, não encontramos nenhum filme com este título :(",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 35),
              Container(
                height: 60,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 29, 29, 30),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 75, 139, 185),
                    ),
                    Container(
                      width: 310,
                      margin: const EdgeInsets.only(left: 5),
                      child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 89, 91, 92),
                                  fontSize: 12)),
                          onChanged: (text) async {
                            setState(() => searchFieldValue = text);
                            if (text.length > 5) {
                              var movies =
                                  await movieController.getMovieSearch(text);
                              setState(() => listMovie = movies);
                            } else {
                              setState(() {
                                searchFieldValue = '';
                              });
                            }
                          }),
                    ),
                  ],
                ),
              ),
              Expanded(child: movieCard()),
            ],
          ),
        ),
        bottomNavigationBar: const CustomNavigationBar());
  }
}
