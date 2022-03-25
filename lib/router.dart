import 'package:dog_app/model/getUserResponse.dart';
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/route_constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.logInScreen:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen(), settings: settings);

      case RoutesConstants.forgotPassword:
        return MaterialPageRoute(
            builder: (_) => const ForgotPassword(), settings: settings);

      case RoutesConstants.verificationScreen:
      final args = settings.arguments as VerificationCodeScreen;
        return MaterialPageRoute(
            builder: (_) => VerificationCodeScreen(email: args.email,forgotCode:args.forgotCode), settings: settings);

      case RoutesConstants.createPassword:
        return MaterialPageRoute(
            builder: (_) => CreatePassword(email:settings.arguments as String), settings: settings);
      case RoutesConstants.signUp:
        return MaterialPageRoute(
            builder: (_) => const SignUpScreen(), settings: settings);

      case RoutesConstants.homeScreen:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(), settings: settings);

      case RoutesConstants.dashBoard:
        return MaterialPageRoute(
            builder: (_) => const DashboardPage(), settings: settings);
      case RoutesConstants.profileScreen:
        return MaterialPageRoute(
            builder: (_) => const ProfileScreen(), settings: settings);
      case RoutesConstants.nfcScan:
        return MaterialPageRoute(builder: (_) => const NfcScan(), settings: settings);
      case RoutesConstants.editProfile:
        return MaterialPageRoute(
            builder: (_) => EditProfileScreen(data: settings.arguments as Data,), settings: settings);

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
