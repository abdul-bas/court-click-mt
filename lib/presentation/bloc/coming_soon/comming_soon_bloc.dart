import 'package:court_click/data/repositories/coming_soon_repository.dart';
import 'package:court_click/presentation/bloc/coming_soon/coming_soon_event.dart';
import 'package:court_click/presentation/bloc/coming_soon/comming_soon_initial_state.dart';
import 'package:court_click/presentation/bloc/coming_soon/comming_soon_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComingSoonBloc extends Bloc<ComingSoonEvent, ComingSoonState> {
  final ComingSoonRepository repository;

  ComingSoonBloc({required this.repository}) : super(ComingSoonInitial()) {
    on<ComingSoonGetEvent>(getUpcomingMovies);
  }

  Future<void> getUpcomingMovies(
    ComingSoonGetEvent event,
    Emitter<ComingSoonState> emit,
  ) async {
    print('.....................................................');
    emit(ComingSoonLoading());
    
    final state = await repository.getUpcomingMovies();

    emit(state);
  }
}
