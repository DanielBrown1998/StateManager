import 'package:flutter/material.dart';
import 'package:app_bloc/screens/movie_screen.dart';

import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            clipBehavior: Clip.hardEdge,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieScreen(movie: movie),
                      ),
                    );
                  },
                  child: movie.imageURI != null
                      ? Ink(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(movie.imageURI!),
                                fit: BoxFit.cover),
                          ),
                        )
                      : Ink(
                          child: const Center(
                            child: Icon(Icons.error),
                          ),
                        )),
            )),
        Text(
          movie.name,
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}
