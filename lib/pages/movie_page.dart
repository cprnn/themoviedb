import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/custom_navigation_bar.dart';
import 'package:themoviedb/models/movie.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w342/${movie.backdropPath}',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Image.asset("../../images/claquete.png"),
              errorWidget: (context, url, error) =>
                  Image.asset("../../images/claquete.png"),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back,
                              color: Colors.white, size: 25),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(135, 66, 66, 66),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                ),
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Color.fromARGB(255, 75, 139, 185),
                                size: 30),
                            Text("${movie.voteAverage}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ))
                          ],
                        ),
                        Text(
                          movie.originalTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          movie.title,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          movie.releaseDate,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          movie.overview,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
