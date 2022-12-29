import 'package:flutter/material.dart';
import 'package:pedalim/route/app_page.dart';
import 'package:pedalim/route/app_route.dart';
import 'package:pedalim/theme/app_theme.dart';
import 'package:get/get.dart';

class MyAppHome extends StatelessWidget {
  const MyAppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
