import 'package:fire_base/screens/edit/view/edit_screen.dart';
import 'package:fire_base/screens/home/view/home_screen.dart';
import 'package:fire_base/screens/input/view/input_screen.dart';
import 'package:fire_base/screens/log/view/signin.dart';
import 'package:get/get.dart';

import '../../screens/log/view/signup.dart';

class Routes{
  static Routes routes = Routes._();
  Routes._();

  List<GetPage> routesList = [
    GetPage(name: '/', page: () => SignInScreen(),),
    GetPage(name: '/signup', page: () => SignUpScreen(),),
    GetPage(name: '/home', page: () => HomeScreen(),),
    GetPage(name: '/input', page: () => InputScreen(),),
    GetPage(name: '/edit', page: () => EditScreen(),),
  ];
}