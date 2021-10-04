import 'package:auto_route/auto_route.dart';
import 'package:compound/app/locator.dart';
import 'package:compound/app/router.gr.dart';
import 'package:compound/services/authentication_service.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  handleStartupLogic({required BuildContext context}) {
    bool hasLoggedInUser = _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      context.router.pushNamed(HomeRoute.name);
    } else {
      context.router.pushNamed(LoginRoute.name);
    }
  }
}
