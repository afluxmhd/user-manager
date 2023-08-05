import 'package:crud_flutter_app/controllers/user_controller.dart';
import 'package:crud_flutter_app/data/repository/user_repo.dart';
import 'package:get/get.dart';

import '../data/api/api_client.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, headers: AppConstants.HEADERS));

  //repos
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => UserController(userRepo: Get.find()));
}
