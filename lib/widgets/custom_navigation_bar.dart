import 'package:flutter/material.dart';
import 'package:themoviedb/pages/search_page.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 29, 29, 30),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
            child: const Icon(
              Icons.home,
              size: 30,
              color: Color.fromARGB(255, 75, 139, 185),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const SearchPage())));
            },
            child: const Icon(
              Icons.search,
              size: 30,
              color: Color.fromARGB(255, 75, 139, 185),
            ),
          ),
        ],
      ),
    );
  }
}
