import 'package:crud_flutter_app/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:crud_flutter_app/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(345, 600),
      builder: (context, child) => GetMaterialApp(
        title: 'User Manager',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            radioTheme: RadioThemeData(
              fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
            )),
        initialRoute: RouteHelper.getInitial(),
        getPages: RouteHelper.routes,
      ),
    );
  }
}
