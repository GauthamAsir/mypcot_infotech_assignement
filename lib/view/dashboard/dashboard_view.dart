import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mypcot_infotech_assignement/utils/constant.dart';
import 'package:mypcot_infotech_assignement/view/customers/customers_view.dart';
import 'package:mypcot_infotech_assignement/view/dashboard/components/dashboard_app_bar.dart';
import 'package:mypcot_infotech_assignement/view/khata/khata_view.dart';
import 'package:mypcot_infotech_assignement/view/orders/orders_view.dart';

import '../home/home_view.dart';

class DashboardView extends StatefulWidget {
  static String routeName = "/dashboard_view";

  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  static final List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    const CustomerView(),
    const KhataView(),
    const OrdersView()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize:
          Size(Get.mediaQuery.size.width, AppBar().preferredSize.height),
          child: const AppBarDashboard()),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(SvgPicture.asset(kHomeIcon), 'Home', 0),
            _buildNavItem(SvgPicture.asset(kCustomersNavIcon), 'Customers', 1),
            const SizedBox(
              width: 20,
              height: 0,
            ),
            _buildNavItem(SvgPicture.asset(kKathaNavIcon), 'Khata', 2),
            _buildNavItem(SvgPicture.asset(kOrdersNavIcon), 'Orders', 3),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 66,
        width: 66,
        child: FloatingActionButton(
            backgroundColor: kIndigoColor,
            onPressed: () {},
            child: const Icon(Icons.add)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }

  Widget _buildNavItem(Widget icon, String text, int pos) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {
              _onItemTapped(pos);
            },
            icon: icon),
        Text(text)
      ],
    );
  }
}
