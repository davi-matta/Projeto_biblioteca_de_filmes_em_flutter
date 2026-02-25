import 'package:biblioteca_flutter/app/modules/dashboard/UI/controller/bidings/home_bidings.dart';
import 'package:biblioteca_flutter/app/modules/dashboard/UI/home_page.dart';
import 'package:biblioteca_flutter/app/modules/movies/UI/movie_form.dart';
import 'package:biblioteca_flutter/app/modules/movies/bindings/movies_bindings.dart';
import 'package:biblioteca_flutter/app/modules/splash/UI/controller/bidings/splash_bidings.dart';
import 'package:biblioteca_flutter/app/modules/splash/UI/splash_page.dart';
import 'package:biblioteca_flutter/app/routes/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


abstract class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBidings(),
    ),

    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name:Routes.MOVIE_FORM,
      page: () => MovieForm(),
      binding: MoviesBindings(),
    ),
  ];
}
