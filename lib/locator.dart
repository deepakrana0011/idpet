import 'package:dog_app/provider/create_password_provider.dart';
import 'package:dog_app/provider/dashboard_provider.dart';
import 'package:dog_app/provider/edit_profile_provider.dart';
import 'package:dog_app/provider/forgot_password_provider.dart';
import 'package:dog_app/provider/home_provider.dart';
import 'package:dog_app/provider/login_provider.dart';
import 'package:dog_app/provider/sign_up_provider.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setUpLocator() {
  locator.registerFactory(() => CreatePasswordProvider());
  locator.registerFactory(() => SignUpProvider());
  locator.registerFactory(() => HomeScreenProvider());
  locator.registerFactory(() => DashboardProvider());
  locator.registerFactory(() => LoginProvider());
  locator.registerFactory(() => ForgotPasswordProvider());
  locator.registerFactory(() => EditProfileProvider());
}
