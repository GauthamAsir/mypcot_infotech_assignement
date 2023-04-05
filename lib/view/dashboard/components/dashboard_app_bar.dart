import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constant.dart';

class AppBarDashboard extends StatelessWidget {
  const AppBarDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(kMenuIcon),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(kFavRoundBgIcon),
          onPressed: () {},
        ),
        IconButton(
          icon: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topRight,
            children: [
              SvgPicture.asset(kNotificationBellIcon),
              Positioned(
                  right: 3,
                  top: 3,
                  child: Container(
                    height: 12,
                    width: 12,
                    padding: const EdgeInsets.all(1),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: const FittedBox(
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
            ],
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(kProfileImage),
          onPressed: () {},
        ),
      ],
    );
  }
}
