import 'package:fire_base/screens/log/view/sign_up.dart';
import 'package:get/get.dart';

class Routes{
  static Routes routes = Routes._();
  Routes._();

  List<GetPage> routesList = [
    GetPage(name: '/', page: () => SignUpScreen(),),
  ];
}