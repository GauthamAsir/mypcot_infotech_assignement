import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mypcot_infotech_assignement/model/timeline_date_model.dart';
import 'package:mypcot_infotech_assignement/utils/constant.dart';
import 'package:mypcot_infotech_assignement/view/home/components/home_cards.dart';

class HomeView extends StatefulWidget {
  static String routeName = "/home_view";

  static const List<String> list = <String>[
    'Timeline 1',
    'Timeline 2',
    'Timeline 3',
    'Timeline 4'
  ];

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String dropdownValue = HomeView.list.first;

  int _selectedIndex = 0;

  List<TimelineDateModel> timeLineList = [];

  void getDates() {
    DateTime now = DateTime.now();
    int lastDay = DateTime(now.year, now.month + 1, 0).day;

    for (int i = 1; i <= lastDay; i++) {
      DateTime dateTime = DateTime(now.year, now.month, i);

      if (now.day == dateTime.day &&
          now.month == dateTime.month &&
          now.year == dateTime.year) {
        _selectedIndex = i - 1;
      }

      timeLineList.add(TimelineDateModel(
          month: dateTime.month,
          date: dateTime.day,
          weekName: DateFormat('EEE').format(dateTime),
          year: dateTime.year));
    }
  }

  @override
  void initState() {
    getDates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            _buildWelcomeCard(),
            const SizedBox(
              height: 40,
            ),
            AspectRatio(
              aspectRatio: 1.3,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: const [
                  HomeCards(cardPos: 0),
                  HomeCards(cardPos: 1),
                  HomeCards(cardPos: 2),
                ],
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            _buildSelectedTimelineCard(),
            const SizedBox(
              height: 24,
            ),
            _buildTimeList(),
            const SizedBox(
              height: 30,
            ),
            _buildNewOrderCreatedCard()
          ],
        ));
  }

  Widget _buildWelcomeCard() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Welcome, Mypcot !!',
        style: Get.textTheme.headline6,
      ),
      subtitle: Text(
        'here is your dashboard....',
        style: Get.textTheme.bodyLarge,
      ),
      trailing: SizedBox(
        child: SvgPicture.asset(kSearchRoundBgIcon),
      ),
    );
  }

  Widget _buildSelectedTimelineCard() {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            dense: true,
            minVerticalPadding: 0,
            minLeadingWidth: 0,
            horizontalTitleGap: 0,
            contentPadding: EdgeInsets.zero,
            title: Text('January, 23 2021',
                style: Get.textTheme.bodyMedium),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Today',
                style: Get.textTheme.headline6,
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                boxShadow: const [kDefaultShadow]),
            alignment: Alignment.center,
            padding:
            const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  items: HomeView.list
                      .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  ))
                      .toList(),
                  isExpanded: false,
                  isDense: true,
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  elevation: 0,
                  value: dropdownValue,
                  onChanged: (String? value) {
                    if (value == null) {
                      return;
                    }

                    setState(() {
                      dropdownValue = value;
                    });
                  }),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                boxShadow: const [kDefaultShadow]),
            alignment: Alignment.center,
            padding:
            const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset(
                  kCalendarIcon,
                  height: 20,
                  width: 20,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text('JAN 2021')
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTimeList() {
    return AspectRatio(
      aspectRatio: 7,
      child: ListView.builder(
        itemBuilder: (_, pos) {
          TimelineDateModel model = timeLineList[pos];

          bool isSelected = _selectedIndex == pos;

          TextStyle selected = Get.textTheme.bodyLarge!.copyWith(
              color: kDarkGreenColor, fontWeight: FontWeight.w700);

          TextStyle unSelected = Get.textTheme.bodyLarge!.copyWith(
              color: kIndigoColor, fontWeight: FontWeight.w400);

          return InkWell(
            onTap: () {
              if (mounted) {
                setState(() {
                  _selectedIndex = pos;
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.only(right: 30),
              child: Column(
                children: [
                  Text(
                    model.weekName.toUpperCase(),
                    style: isSelected
                        ? selected.copyWith(fontSize: 18)
                        : unSelected.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    model.date.toString(),
                    style: isSelected
                        ? selected.copyWith(fontSize: 18)
                        : unSelected.copyWith(fontSize: 18),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: timeLineList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildNewOrderCreatedCard() {
    return Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text(
                      'New order created',
                      style: Get.textTheme.headline6,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'New Order created with Order No. 1345d423.',
                        style: Get.textTheme.bodyMedium!
                            .copyWith(color: Colors.black87),
                      ),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: Text(
                      '09:00 AM',
                      style: Get.textTheme.bodyLarge!
                          .copyWith(color: kLightOrangeColor),
                    ),
                    subtitle: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      alignment: Alignment.centerLeft,
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        color: kLightOrangeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1.2,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 14),
                  decoration: const BoxDecoration(
                    color: kLightOrangeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    kNewOrderImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          ],
        ));
  }


}
