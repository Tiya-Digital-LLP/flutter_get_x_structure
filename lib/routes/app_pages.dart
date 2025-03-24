import 'package:get/get.dart';
import 'package:getxstructure/firstscreen/first_screen.dart';
import 'package:getxstructure/login/login_screen.dart';
import 'package:getxstructure/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(name: Routes.login, page: () => const LoginScreen()),
    GetPage(name: Routes.first, page: () => const FirstScreen()),
  ];
}
