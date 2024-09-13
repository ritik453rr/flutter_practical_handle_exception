import 'package:exceptions_handle/data/network/base_api_services.dart';
import 'package:exceptions_handle/data/network/network_api_service.dart';
import 'package:exceptions_handle/model/movie_list_model.dart';
import 'package:exceptions_handle/res/app_url.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<MovieListModel> fetchMovieList() async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(AppUrl.movieslistEndPoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
