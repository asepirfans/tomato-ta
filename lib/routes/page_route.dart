import 'package:get/get.dart';
import 'route_name.dart';
import '../pages/homePage.dart';
import '../pages/monitoringDetailPages/monitoringDetailPagePlant1.dart';
import '../pages/monitoringDetailPages/monitoringDetailPagePlant2.dart';
import '../pages/monitoringDetailPages/monitoringDetailPagePlant3.dart';
import '../pages/monitoringPage.dart';
import '../pages/detect.dart';
import '../pages/detect_page.dart';
import '../pages/pumpPage.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.homePage,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteName.monitoringPage,
      page: () => MonitoringPage(),
    ),
    GetPage(
      name: RouteName.monitoringDetailPagePlant1,
      page: () => MonitoringDetailPagePlant1(),
    ),
    GetPage(
      name: RouteName.monitoringDetailPagePlant2,
      page: () => MonitoringDetailPagePlant2(),
    ),
    GetPage(
      name: RouteName.monitoringDetailPagePlant3,
      page: () => MonitoringDetailPagePlant3(),
    ),
    GetPage(
      name: RouteName.detect,
      page: () => DetectPage(),
    ),
    GetPage(
      name: RouteName.detectPage,
      page: () => Detect(),
    ),
    GetPage(
      name: RouteName.pumpPage,
      page: () => PumpPage(),
    ),
  ];
}
