import 'package:flutter/material.dart';
import 'package:testapp/animated.dart';
import 'package:testapp/models/homepage.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('ru'),
          Locale('uz'),
        ],
        path: "assets/lang",
        fallbackLocale: Locale('ru'),
        saveLocale: true,
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Ubuntu",
        primaryColor: Colors.black,
      ),
      home: Homepage(),
    );
  }
}
