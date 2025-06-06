import 'package:app_bloc/logic/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:app_bloc/components/movie_screen/tab_bar_movie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/movie_screen/poster.dart';
import '../components/movie_screen/poster_card.dart';
import '../models/movie.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ThemeCubit>(context).changeTheme(theme: movie.genre);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Poster(imageURL: movie.imageURI),
                PosterCard(
                  title: movie.name,
                  genre: movie.genre,
                  classification: movie.classification,
                  duration: movie.duration,
                ),
              ],
            ),
          ),
          Expanded(child: TabBarMovie(movie: movie)),
        ],
      ),
    );
  }
}
