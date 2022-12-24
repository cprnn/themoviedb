import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/controllers/movie_controller.dart';
import 'package:themoviedb/models/movie.dart';
import 'package:themoviedb/pages/movie_page.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({super.key});

  @override
  State<NowPlaying> createState() => _NowPlaying();
}

class _NowPlaying extends State<NowPlaying> {
  final MovieController movieController = MovieController();
  List<Movie> nowPlayingMovies = [];

  _NowPlaying() {
    movieController
        .getNowPlaying()
        .then((value) => setState(() => nowPlayingMovies = value));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Now Playing",
                style: TextStyle(
                    color: Color.fromARGB(255, 75, 139, 185),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "See more",
              //   style: TextStyle(color: Colors.white54, fontSize: 13),
              // )
            ],
          ),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var movie in nowPlayingMovies)
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => MoviePage(movie: movie))));
                  },
                  child: Container(
                    width: 200,
                    height: 410,
                    margin: const EdgeInsets.only(left: 10),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w342/${movie.posterPath}',
                            height: 300,
                            width: 200,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Image.asset("../../images/claquete.png"),
                            errorWidget: (context, url, error) =>
                                Image.asset("../../images/claquete.png"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.originalTitle,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Color.fromARGB(255, 75, 139, 185)),
                                  const SizedBox(width: 5),
                                  Text("${movie.voteAverage}",
                                      style: const TextStyle(
                                        color: Colors.white54,
                                        fontSize: 20,
                                      )),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
