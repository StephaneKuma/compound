import 'package:auto_route/annotations.dart';
import 'package:compound/ui/views/home/home_view.dart';
import 'package:compound/ui/views/login/login_view.dart';
import 'package:compound/ui/views/register/register_view.dart';
import 'package:compound/ui/views/startup/startup_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: StartupView, initial: true,),
    AutoRoute(page: LoginView),
    AutoRoute(page: RegisterView),
    AutoRoute(page: HomeView)
  ],
)
class $AppRouter {}
