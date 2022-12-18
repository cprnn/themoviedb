import 'package:flutter/material.dart';

class UpcomingMovies extends StatelessWidget {
  const UpcomingMovies({super.key});

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
              for (int i = 1; i < 5; i++)
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "movie");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "images/profile.jpg", //TODO: alterar pelas imagens da API
                        height: 200,
                        width: 300,
                        fit: BoxFit.cover,
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
