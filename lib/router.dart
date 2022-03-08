import 'package:dog_app/views/create_password_screen/create_password.dart';
import 'package:dog_app/views/dashbord/dashbord.dart';
import 'package:dog_app/views/edit_profile_screen/edit_profile_screen.dart';
import 'package:dog_app/views/forgot_password_screen/forgot_password.dart';
import 'package:dog_app/views/home_screen/home_screen.dart';
import 'package:dog_app/views/login_screen/login_screen.dart';
import 'package:dog_app/views/nfc_Scan/bar_code_scan.dart';
import 'package:dog_app/views/profile_screen/profile_screen.dart';
import 'package:dog_app/views/sign_up_screen/sign_up.dart';
import 'package:dog_app/views/verifiction_code_screen/verification_code.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/route_constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.logInScreen:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(), settings: settings);

      case RoutesConstants.forgotPassword:
        return MaterialPageRoute(
            builder: (_) => ForgotPassword(), settings: settings);

      case RoutesConstants.verificationScreen:
        return MaterialPageRoute(
            builder: (_) => VerificationCodeScreen(), settings: settings);

      case RoutesConstants.createPassword:
        return MaterialPageRoute(
            builder: (_) => CreatePassword(), settings: settings);
      case RoutesConstants.signUp:
        return MaterialPageRoute(
            builder: (_) => SignUpScreen(), settings: settings);

      case RoutesConstants.homeScreen:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(), settings: settings);

      case RoutesConstants.dashBoard:
        return MaterialPageRoute(
            builder: (_) => DashboardPage(), settings: settings);
      case RoutesConstants.profileScreen:
        return MaterialPageRoute(
            builder: (_) => ProfileScreen(), settings: settings);
      case RoutesConstants.nfcScan:
        return MaterialPageRoute(builder: (_) => NfcScan(), settings: settings);
      case RoutesConstants.editProfile:
        return MaterialPageRoute(
            builder: (_) => EditProfileScreen(), settings: settings);

      default:
        //return MaterialPageRoute(builder: (_) =>  Testing());
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
