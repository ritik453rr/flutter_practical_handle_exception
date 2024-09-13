import 'package:exceptions_handle/data/response/api_response.dart';
import 'package:exceptions_handle/model/movie_list_model.dart';
import 'package:exceptions_handle/repository/home_repository.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMovieList(ApiResponse<MovieListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMovieList(ApiResponse.loading());

    _myRepo.fetchMovieList().then((value) {
      setMovieList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMovieList(ApiResponse.error(error.toString()));
    });
  }
}
