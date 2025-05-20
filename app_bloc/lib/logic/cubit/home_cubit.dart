import 'package:app_bloc/models/movie.dart';
import 'package:app_bloc/services/movies_api.dart';
import 'package:bloc/bloc.dart';
part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  final HomeService homeService = HomeService();

  Future<void> getMovies({String genre = "Todos"}) async {
    emit(HomeLoading());
    List<Movie> movies = [];
    try {
      if (genre != "Todos") {
        movies = await homeService.fetchMoviesByGenre(genre);
      } else {
        movies = await homeService.fetchMovies();
      }
      if (movies.isEmpty) {
        emit(HomeError(msg: "Nenhum filme encontrado!"));
      } else {
        emit(HomeSuccess(data: movies));
      }
    } catch (e) {
      emit(HomeError(msg: "Houve um erro!"));
    }
  }
}
