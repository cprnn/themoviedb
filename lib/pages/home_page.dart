import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/custom_navigation_bar.dart';
import 'package:themoviedb/widgets/new_movies.dart';
import 'package:themoviedb/widgets/upcoming_movies.dart';

import '../widgets/top_rated.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Image.asset(
                  "images/logo.png",
                  width: 100,
                  height: 100,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Welcome!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                )),
                            Text("What do you want to watch today?",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 75, 139, 185),
                                  fontSize: 15,
                                ))
                          ],
                        ),
                      ]),
                ),
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
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const UpcomingMovies(),
                const SizedBox(height: 30),
                const NewMovies(),
                const SizedBox(height: 30),
                const TopRated(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomNavigationBar());
  }
}