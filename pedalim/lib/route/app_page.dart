import 'package:pedalim/route/app_route.dart';
import 'package:pedalim/view/dashboard/dashboard_binding.dart';
import 'package:pedalim/view/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';

class AppPage {
  static var list = [
    GetPage(
        name: AppRoute.dashboard,
        page: () => const DashboardScreen(),
        binding: DashboardBinding())
  ];
}
