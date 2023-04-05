import 'package:get/get.dart';
import '../view/customers/customers_view.dart';
import '../view/dashboard/dashboard_view.dart';
import '../view/home/home_view.dart';
import '../view/khata/khata_view.dart';
import '../view/orders/orders_view.dart';

import '../view/splash/splash_screen.dart';

final kInitialRoute = SplashScreen.routeName;

final List<GetPage> routes = [
  GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
  GetPage(name: DashboardView.routeName, page: () => const DashboardView()),
  GetPage(name: HomeView.routeName, page: () => HomeView()),
  GetPage(name: CustomerView.routeName, page: () => const CustomerView()),
  GetPage(name: KhataView.routeName, page: () => const KhataView()),
  GetPage(name: OrdersView.routeName, page: () => const OrdersView()),
];