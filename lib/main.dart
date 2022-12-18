import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:themoviedb/pages/home_page.dart';
import 'package:themoviedb/pages/movie_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(0, 37, 36, 36),
        ),
        routes: {
          "/": (context) => const HomePage(),
          "movie": (context) => const MoviePage(),
        });
  }
}
