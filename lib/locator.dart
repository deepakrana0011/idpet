import 'package:dio/dio.dart';
import 'package:dog_app/enum/save_token.dart';
import 'package:dog_app/provider/add_pet_provider.dart';
import 'package:dog_app/provider/create_new_password_provider.dart';
import 'package:dog_app/provider/dashboard_provider.dart';
import 'package:dog_app/provider/edit_pet_profile_provider.dart';
import 'package:dog_app/provider/edit_profile_provider.dart';
import 'package:dog_app/provider/forgot_password_provider.dart';
import 'package:dog_app/provider/get_pet_provider.dart';
import 'package:dog_app/provider/get_singlePet_provider.dart';
import 'package:dog_app/provider/home_provider.dart';
import 'package:dog_app/provider/login_provider.dart';
import 'package:dog_app/provider/nfc_write.dart';
import 'package:dog_app/provider/profile_provider.dart';
import 'package:dog_app/provider/sign_up_provider.dart';
import 'package:dog_app/provider/verify_code_provider.dart';
import 'package:dog_app/services/apiServices.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setUpLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton<SaveToken>(() => SaveToken());
  locator.registerFactory(() => CreateNewPasswordProvider());
  locator.registerFactory(()=>NfcProvider());
  locator.registerFactory(() => SignUpProvider());
  //locator.registerFactory(() => HomeScreenProvider());
  locator.registerFactory(() => DashboardProvider());
  locator.registerFactory(() => ProfileScreenProvider());
  locator.registerFactory(() => AddPetProvider());
  locator.registerFactory(() => GetPetHomeProvider());
  locator.registerFactory(() => LoginProvider());
  locator.registerFactory(() => EditPetProfileProvider());
  locator.registerFactory(() => VerificationProviders());
  locator.registerFactory(() => ForgotPasswordProvider());
  locator.registerFactory(() => EditProfileProvider());
  locator.registerFactory(() => GetSinglePetProvider());
  locator.registerLazySingleton<Dio>(() {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
    return dio;
  });

      }
