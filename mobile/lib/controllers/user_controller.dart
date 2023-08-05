import 'package:crud_flutter_app/base/show_custom_snackbar.dart';
import 'package:crud_flutter_app/model/response_model.dart';
import 'package:crud_flutter_app/model/user_model.dart';
import 'package:get/get.dart';
import '../data/repository/user_repo.dart';

class UserController extends GetxController implements GetxService {
  UserController({required this.userRepo});
  final UserRepo userRepo;

  final bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<UserModel> _userList = [];
  List<UserModel> get userList => _userList;

  Future<void> getAllUsers() async {
    Response response = await userRepo.getAllUser();
    _userList = [];

    try {
      response.body.forEach((user) {
        _userList.add(UserModel.fromJson(user));
      });
    } catch (e) {
      showCustomSnackBar('Server is not running!');
    }
    update();
  }

  Future<ResponseModel> updateUser(UserModel user) async {
    late ResponseModel responseModel;

    Map<String, dynamic> userJson = user.toJson();
    Response response = await userRepo.updateUser(userJson, user.id);

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, 'Successfull');
      return responseModel;
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      return responseModel;
    }
  }

  Future<UserModel> getUser(String id) async {
    Response response = await userRepo.getUser(id);
    UserModel user = UserModel.fromJson(response.body);

    return user;
  }

  Future<ResponseModel> createUser(UserModel user) async {
    late ResponseModel responseModel;

    Map<String, dynamic> userJson = user.toJson();

    Response response = await userRepo.createUser(userJson);

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, 'Successfull');
      return responseModel;
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      return responseModel;
    }
  }

  Future<ResponseModel> deleteUser(String id) async {
    late ResponseModel responseModel;

    Response response = await userRepo.deleteUser(id);

    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, 'Succesfull');
      return responseModel;
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      return responseModel;
    }
  }
}
