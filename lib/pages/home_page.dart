import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/custom_navigation_bar.dart';
import 'package:themoviedb/widgets/now_playing.dart';
import 'package:themoviedb/widgets/upcoming_movies.dart';
import 'package:themoviedb/widgets/top_rated.dart';

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
                const UpcomingMovies(),
                const SizedBox(height: 30),
                const NowPlaying(),
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
