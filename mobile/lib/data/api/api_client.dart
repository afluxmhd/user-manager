import 'package:crud_flutter_app/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  ApiClient({required this.appBaseUrl, required this.headers});

  final String appBaseUrl;
  final Map<String, String> headers;

  //Get Method
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(AppConstants.BASE_URL + uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  //Post Method
  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(AppConstants.BASE_URL + uri, body, headers: headers);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  //Put Method
  Future<Response> putData(String uri, dynamic body) async {
    try {
      Response response = await put(AppConstants.BASE_URL + uri, body);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  //Delete Method
  Future<Response> deleteData(String uri) async {
    try {
      Response response = await delete(AppConstants.BASE_URL + uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
