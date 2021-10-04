import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

GetIt locator = GetIt.I;

@InjectableInit()
void setupLocator() => $initGetIt(locator);
