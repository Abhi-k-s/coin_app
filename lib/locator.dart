import 'package:coinapp/repository/auth_repo.dart';
import 'package:coinapp/repository/storage_repo.dart';
import 'package:coinapp/view_controller/user_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerSingleton<AuthService>(AuthService());
  locator.registerSingleton<StorageRepo>(StorageRepo());
  locator.registerSingleton<UserController>(UserController());
}