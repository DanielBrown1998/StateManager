import 'package:app_bloc/models/movie.dart';
import 'package:app_bloc/services/movies_api.dart';
import 'package:bloc/bloc.dart';
part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  final HomeService homeService = HomeService();

  Future<void> getMovies() async {
    emit(HomeLoading());
    try {
      final List<Movie> movies = await homeService.fetchMovies();
      emit(HomeSuccess(data: movies));
    } catch (e) {
      emit(HomeError(msg: "Houve um erro!"));
    }
  }
}
