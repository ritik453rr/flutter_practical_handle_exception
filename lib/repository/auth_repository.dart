import 'package:exceptions_handle/data/network/base_api_services.dart';
import 'package:exceptions_handle/data/network/network_api_service.dart';
import 'package:exceptions_handle/res/app_url.dart';

class AuthRepository {
  
  final BaseApiServices _apiServices = NetworkApiService();

  //login Api
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      rethrow ;
    }
  }

  //signUP api
  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
