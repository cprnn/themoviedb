import 'package:flutter/material.dart';
import 'package:themoviedb/controllers/movie_controller.dart';
import 'package:themoviedb/models/movie.dart';
import 'package:themoviedb/widgets/custom_navigation_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  final MovieController movieController = MovieController();

  String searchFieldValue = "";
  List<Movie> listMovie = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 15),
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
                        width: 300,
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
                              if (text.length > 3) {
                                var movies =
                                    await movieController.getMovieSearch(text);
                                setState(() => listMovie = movies);
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomNavigationBar());
  }
}
