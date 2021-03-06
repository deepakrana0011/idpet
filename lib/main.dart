import 'package:dog_app/constants/route_constants.dart';
import 'package:dog_app/helper/shared_pref.dart';
import 'package:dog_app/provider/dashboard_provider.dart';
import 'package:dog_app/views/login_screen/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'router.dart' as router;

import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    EasyLocalization(
        path: 'langs',
        supportedLocales: const [
          Locale('en'),
        ],
        fallbackLocale: const Locale('en'),
        child: const MyApp()),
  );
  setUpLocator();
  SharedPref.prefs = await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: "Dog App",
            onGenerateRoute: router.Router.generateRoute,
            initialRoute:SharedPref.prefs?.getString(SharedPref.JWTTOKEN) == null
                ? RoutesConstants.logInScreen
                : RoutesConstants.dashBoard,
            builder: (context, widget) {
              ScreenUtil.setContext(context);
              return MediaQuery(
                //Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            }),
    );
  }
}
