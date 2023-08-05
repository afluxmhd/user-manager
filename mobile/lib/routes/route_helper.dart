import 'package:crud_flutter_app/pages/create_user_screen.dart';
import 'package:crud_flutter_app/pages/update_user_screen.dart';
import 'package:crud_flutter_app/pages/user_screen.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  static const String initial = "/";
  static const String createUser = "/create-user";
  static const String updateUser = "/update-user";

  static String getInitial() => initial;
  static String getCreateUserPage() => createUser;
  static String getUpdateUserPage(String id) => 'update-user?id=$id';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () {
        return const UserScreen();
      },
    ),
    GetPage(
        name: createUser,
        page: () {
          return const CreateUserScreen();
        },
        transition: Transition.rightToLeft),
    GetPage(
      name: updateUser,
      page: () {
        var id = Get.parameters['id'];
        return UpdateUserScreen(id: id!);
      },
      transition: Transition.rightToLeft,
    ),
  ];
}
