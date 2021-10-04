// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../ui/views/home/home_view.dart' as _i4;
import '../ui/views/login/login_view.dart' as _i2;
import '../ui/views/register/register_view.dart' as _i3;
import '../ui/views/startup/startup_view.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.StartupView());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginView(key: args.key));
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.RegisterView(key: args.key));
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeView());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(StartupRoute.name, path: '/'),
        _i5.RouteConfig(LoginRoute.name, path: '/login-view'),
        _i5.RouteConfig(RegisterRoute.name, path: '/register-view'),
        _i5.RouteConfig(HomeRoute.name, path: '/home-view')
      ];
}

/// generated route for [_i1.StartupView]
class StartupRoute extends _i5.PageRouteInfo<void> {
  const StartupRoute() : super(name, path: '/');

  static const String name = 'StartupRoute';
}

/// generated route for [_i2.LoginView]
class LoginRoute extends _i5.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i6.Key? key})
      : super(name, path: '/login-view', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i6.Key? key;
}

/// generated route for [_i3.RegisterView]
class RegisterRoute extends _i5.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i6.Key? key})
      : super(name, path: '/register-view', args: RegisterRouteArgs(key: key));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i6.Key? key;
}

/// generated route for [_i4.HomeView]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/home-view');

  static const String name = 'HomeRoute';
}
