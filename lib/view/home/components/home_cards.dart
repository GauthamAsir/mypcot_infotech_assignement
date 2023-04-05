import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constant.dart';

class HomeCards extends StatelessWidget {
  final cardPos;

  const HomeCards({Key? key, this.cardPos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardPos == 0
        ? _buildOrderCard()
        : cardPos == 1
            ? _buildSubscriptionCard()
            : _buildCustomersCard();
  }

  Widget _buildOrderCard() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerRight,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Image.asset(kOrdersImage)),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kButtonColor),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 8)),
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))))),
                  child: Text(
                    'Orders',
                    style:
                        Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ))
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 30,
          child: _buildCard(
              'You have ', '3', ' active\norders from', 3, kButtonColor),
        ),
        Positioned(
          bottom: 85,
          right: 30,
          child: _buildCard('', '02', ' Pending\nOrders from', 2, Colors.white),
        ),
      ],
    );
  }

  Widget _buildSubscriptionCard() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerRight,
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            width: Get.width,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: const BoxDecoration(
                color: kYellowColor,
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Image.asset(kSubscriptionImage)),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kDarkBlueColor),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8)),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))))),
                    child: Text(
                      'Subscriptions',
                      style: Get.textTheme.bodyMedium!
                          .copyWith(color: Colors.white),
                    ))
              ],
            )),
        Positioned(
          bottom: 110,
          right: 30,
          child:
              _buildCard('', '10', ' Active\nSubscriptions', 0, Colors.white),
        ),
        Positioned(
          top: 0,
          right: 50,
          child: _buildCard(
              '', '03', ' deliveries\npending for', 3, kDarkBlueColor),
        ),
        Positioned(
          bottom: 25,
          right: 20,
          child:
              _buildCard('', '02', ' Pending\nSubscriptions', 0, Colors.white),
        ),
      ],
    );
  }

  Widget _buildCustomersCard() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerRight,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          width: Get.width,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: const BoxDecoration(
              color: kGreenAccentColor,
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Image.asset(kCustomersImage)),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(kDarkPinkColor),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8)),
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))))),
                  child: Text(
                    'View Customers',
                    style:
                        Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ))
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 30,
          child: _buildCard(
              'You have ', '3', ' active\norders from', 3, kDarkPinkColor),
        ),
        Positioned(
          bottom: 85,
          right: 30,
          child: _buildCard('', '02', ' Pending\nOrders from', 2, Colors.white),
        ),
      ],
    );
  }

  Widget _buildCard(String lText, String bText, String endText,
      int profileCount, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
          color: bgColor,
          boxShadow: const [kDefaultShadow],
          borderRadius: const BorderRadius.all(Radius.circular(18))),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 55,
              right: profileCount <= 2 ? 10 : null,
              child: Stack(
                  clipBehavior: Clip.none,
                  children: _buildProfileList(profileCount))),
          Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 20),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: lText,
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: bgColor.computeLuminance() > 0.8
                            ? kTextColor
                            : Colors.white,
                      )),
                  TextSpan(
                      text: bText,
                      style: Get.textTheme.headline6!.copyWith(
                          color: bgColor.computeLuminance() > 0.8
                              ? kTextColor
                              : Colors.white,
                          fontWeight: FontWeight.w900)),
                  TextSpan(
                      text: endText,
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: bgColor.computeLuminance() > 0.8
                            ? kTextColor
                            : Colors.white,
                      )),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildProfileList(int count) {
    List<Widget> list = [];

    for (int i = 0; i < count; i++) {
      if (i == 1) {
        list.add(_buildProfileIcon(i));

        list.add(_buildProfileIcon(0));
      } else if (i != 0) {
        list.add(_buildProfileIcon(i));
      }
    }

    return list;
  }

  Widget _buildProfileIcon(int pos) {
    int kSpace = 25;

    if (pos == 0) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.red, width: 2)),
      );
    }

    if (pos == 1) {
      return Positioned(
        left: kSpace - (kSpace * 2),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.red, width: 2)),
        ),
      );
    }

    return Positioned(
      left: (kSpace * (pos - 1)).roundToDouble(),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.red, width: 2)),
      ),
    );
  }
}
