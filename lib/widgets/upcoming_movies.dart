import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/controllers/movie_controller.dart';
import 'package:themoviedb/models/movie.dart';
import 'package:themoviedb/pages/movie_page.dart';

class UpcomingMovies extends StatefulWidget {
  const UpcomingMovies({super.key});

  @override
  State<UpcomingMovies> createState() => _UpcomingMovies();
}

class _UpcomingMovies extends State<UpcomingMovies> {
  final MovieController movieController = MovieController();
  List<Movie> upcomingMovies = [];

  _UpcomingMovies() {
    movieController
        .getUpcomingMovies()
        .then((value) => setState(() => upcomingMovies = value));
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
                "Upcoming Movies",
                style: TextStyle(
                    color: Color.fromARGB(255, 75, 139, 185),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "See more",
              //   style: TextStyle(color: Colors.white54, fontSize: 13),
              // ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var movie in upcomingMovies)
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => MoviePage(movie: movie))));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/w342/${movie.posterPath}',
                        height: 300,
                        width: 150,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Image.asset("images/claquete.png"),
                        errorWidget: (context, url, error) =>
                            Image.asset("images/claquete.png"),
                      ),
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
