import 'package:court_click/data/model/movie_model.dart';
import 'package:court_click/presentation/bloc/coming_soon/comming_soon_state.dart';
import 'package:flutter/material.dart';

class ComingSoonController extends ChangeNotifier {
  ComingSoonState state = ComingSoonLoading();
  List<MovieModel> movies = [];

 
  final Set<int> reminded = {};

  void onState(ComingSoonState newState) {
    state = newState;
    if (newState is ComingSoonLoaded) movies = newState.movies;
    notifyListeners();
  }

  bool isReminded(int id) => reminded.contains(id);

  void toggleReminder(int id) {
    reminded.contains(id) ? reminded.remove(id) : reminded.add(id);
    notifyListeners();
  }
}