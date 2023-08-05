import 'package:crud_flutter_app/data/api/api_client.dart';
import 'package:crud_flutter_app/utils/app_constants.dart';
import 'package:get/get.dart';

class UserRepo {
  UserRepo({required this.apiClient});
  final ApiClient apiClient;

  Future<Response> getAllUser() async {
    return await apiClient.getData(AppConstants.USERS_URI);
  }

  Future<Response> createUser(dynamic body) async {
    return await apiClient.postData(AppConstants.USERS_URI, body);
  }

  Future<Response> getUser(String id) async {
    return await apiClient.getData('${AppConstants.USERS_URI}?id=$id');
  }

  Future<Response> updateUser(dynamic body, String id) async {
    return await apiClient.putData('${AppConstants.USERS_URI}$id', body);
  }

  Future<Response> deleteUser(String id) async {
    return await apiClient.deleteData('${AppConstants.USERS_URI}$id');
  }
}
