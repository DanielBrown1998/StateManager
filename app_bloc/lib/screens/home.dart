import 'package:app_bloc/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:app_bloc/components/home/genre_filter.dart';
import 'package:app_bloc/components/movie_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeCubit homeCubit = HomeCubit();

  @override
  void initState() {
    homeCubit.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Text(
                  "Filmes",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const GenreFilter(),
              BlocBuilder<HomeCubit, HomeStates>(
                bloc: homeCubit,
                builder: (context, state) {
                  switch (state) {
                    case HomeLoading _:
                      return SliverFillRemaining(
                        child: Center(
                          child: Column(
                            children: [
                              CircularProgressIndicator(),
                              Text("Loading..."),
                            ],
                          ),
                        ),
                      );
                    case HomeSuccess _:
                      return SliverGrid.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisExtent: 240,
                            ),
                        itemBuilder: (context, index) {
                          return MovieCard(movie: state.data[index]);
                        },
                        itemCount: state.data.length,
                      );
                    case HomeError _:
                      return SliverFillRemaining(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.not_accessible_outlined),
                              Text(state.msg),
                            ],
                          ),
                        ),
                      );
                    default:
                      return SliverFillRemaining(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.not_accessible_outlined),
                              Text("Erro desconhecido..."),
                            ],
                          ),
                        ),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
