import 'package:flutter/material.dart';
import 'package:myapp/controllers/language_controller.dart';
import 'utils/dep.dart'as dep;
import 'package:myapp/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/app_constants.dart';
import 'package:myapp/utils/app_routes.dart';
import 'package:myapp/utils/messages.dart';
import 'controllers/language_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await dep.init();
  runApp(MyApp(languages: languages));
}



class MyApp extends StatelessWidget {
  MyApp({required this.languages});
  final Map<String, Map<String, String>> languages;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        locale: localizationController.locale,
        translations: Messages(languages: languages),
        fallbackLocale: Locale(AppConstants.languages[0].languageCode,
            AppConstants.languages[0].countryCode),
        initialRoute: RouteHelper.getSplashRoute(),
        getPages: RouteHelper.routes,
      );
    });
  }
}
