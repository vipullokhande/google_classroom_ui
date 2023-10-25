import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_classroom_ui/screens/inner_screen.dart';
import 'package:google_classroom_ui/widgets/single_classroom.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/dar_mode_controller.dart';
import '../widgets/nav_recycle_item.dart';

enum AppItem { refresh, send }

enum AccountItem { remove }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;

    final backgroundColor = isDark ? Colors.black : Colors.white;
    final foregroundColor = isDark ? Colors.white : Colors.black;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<String> tutors = [
      'Prof ABC',
      'Prof DEF',
      'Prof GHI',
      'Prof ABC',
      'Prof DEF',
      'Prof GHI',
      'Prof ABC',
      'Prof DEF',
      'Prof GHI',
      'Prof ABC',
      'Prof DEF',
      'Prof GHI'
    ];
    List<String> backgrounds = [
      'https://otus.com/wp-content/uploads/2020/09/2-1024x576.png',
      'https://media.istockphoto.com/id/1314385575/photo/kindergarten-classroom-and-frame-for-mockup-3d-rendering.jpg?s=612x612&w=is&k=20&c=d0nS6WSqoi7aYc4NExyotr759aDSwb8w3LQDsz8JwBs=',
      'https://media.istockphoto.com/id/1205276835/vector/empty-classroom-interior-school-or-college-class.jpg?s=612x612&w=0&k=20&c=K9fFk7oxhT4ztcaPI0hrhDxajR_6dzyMwUsSi0jP1Lg=',
      'https://otus.com/wp-content/uploads/2020/09/2-1024x576.png',
      'https://www.shutterstock.com/shutterstock/photos/1666773679/display_1500/stock-photo-classroom-in-university-for-education-d-rendering-1666773679.jpg',
      'https://media.istockphoto.com/id/1205276835/vector/empty-classroom-interior-school-or-college-class.jpg?s=612x612&w=0&k=20&c=K9fFk7oxhT4ztcaPI0hrhDxajR_6dzyMwUsSi0jP1Lg=',
      'https://otus.com/wp-content/uploads/2020/09/2-1024x576.png',
      'https://www.shutterstock.com/shutterstock/photos/1666773679/display_1500/stock-photo-classroom-in-university-for-education-d-rendering-1666773679.jpg',
      'https://media.istockphoto.com/id/1205276835/vector/empty-classroom-interior-school-or-college-class.jpg?s=612x612&w=0&k=20&c=K9fFk7oxhT4ztcaPI0hrhDxajR_6dzyMwUsSi0jP1Lg=',
      'https://otus.com/wp-content/uploads/2020/09/2-1024x576.png',
      'https://www.shutterstock.com/shutterstock/photos/1666773679/display_1500/stock-photo-classroom-in-university-for-education-d-rendering-1666773679.jpg',
      'https://media.istockphoto.com/id/1205276835/vector/empty-classroom-interior-school-or-college-class.jpg?s=612x612&w=0&k=20&c=K9fFk7oxhT4ztcaPI0hrhDxajR_6dzyMwUsSi0jP1Lg=',
    ];
    final List<Color> colors = [
      Colors.pink,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.brown,
      Colors.purple,
      Colors.pink,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.brown,
      Colors.purple
    ];
    List<String> classRoomNames = [
      'Digital Forensics',
      'Distributed Computing',
      'Social Media Analytics',
      'Environmental Management',
      'Digital Forensics',
      'Distributed Computing',
      'Social Media Analytics',
      'Environmental Management',
      'Digital Forensics',
      'Distributed Computing',
      'Social Media Analytics',
      'Environmental Management'
    ];
    List<String> navFooterTitles = [
      'Offline files',
      'Archived classes',
      'Classroom folders',
      'Settings',
      'Help'
    ];
    List<IconData> navFooterIcons = [
      Icons.offline_pin,
      Icons.archive_outlined,
      Icons.folder_open_rounded,
      Icons.settings,
      Icons.help_outline_outlined
    ];
    List<String> navHeaderTitles = ['Classes', 'Calender', 'Notifications'];
    List<IconData> navHeaderIcons = [
      Icons.home_outlined,
      Icons.calendar_today_outlined,
      Icons.notifications_none_rounded
    ];
    Widget buildNavItem(String title, IconData icon) {
      return ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 2,
        ),
        leading: Icon(
          icon,
          color: isDark ? Colors.white : Colors.black,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {},
      );
    }

    Widget buildPopUpMenuButton() => PopupMenuButton(
          splashRadius: 10,
          color: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(
              color: foregroundColor,
              width: 1,
            ),
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: AccountItem.remove,
                child: Text(
                  'Remove',
                  style: TextStyle(
                    color: foregroundColor,
                  ),
                ),
              ),
            ];
          },
          child: Icon(
            Icons.more_vert_rounded,
            color: foregroundColor,
          ),
        );
    // Random random = Random();
    return ResponsiveBuilder(builder: ((context, sizingInformation) {
      var navWidth =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? width * 0.70
              : width * 0.3;
      var resWidth =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? width * 0.25
              : width * 0.12;
      // var resSCWidth =
      //     sizingInformation.deviceScreenType == DeviceScreenType.mobile
      //         ? double.maxFinite
      //         : width * 0.7;
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            elevation: 0,
            title: const Text(
              'Google Classroom',
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
              textScaleFactor: 1.2,
            ),
            actions: [
              GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (_) {
                    return Dialog(
                      backgroundColor: backgroundColor,
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          width: 1,
                          color: foregroundColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: foregroundColor,
                                  ),
                                ),
                                Image.asset(
                                  'assets/google_text.png',
                                  height: height * 0.06,
                                  width: width * 0.5,
                                ),
                              ],
                            ),
                            ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                ListTile(
                                  leading: ClipOval(
                                    child: Image.asset(
                                      'assets/vip.png',
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Text(
                                    'Vipul Lokhande',
                                    style: TextStyle(
                                      color: foregroundColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Text(
                                    'vipullokhande1@gmail.com',
                                    style: TextStyle(
                                      color: foregroundColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  trailing: buildPopUpMenuButton(),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: ClipOval(
                                    child: Image.asset(
                                      'assets/l.png',
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Text(
                                    'Vipul Lokhande',
                                    style: TextStyle(
                                      color: foregroundColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Text(
                                    'lokhande.vipul@kgce.edu.in',
                                    style: TextStyle(
                                      color: foregroundColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  trailing: buildPopUpMenuButton(),
                                  onTap: () {},
                                ),
                              ],
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.only(
                                left: width * 0.07,
                              ),
                              leading: Icon(
                                Icons.group_add_outlined,
                                color: foregroundColor,
                              ),
                              title: Text(
                                'Add another account',
                                style: TextStyle(
                                  color: foregroundColor,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/vip.png',
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              PopupMenuButton(
                splashRadius: 10,
                color: backgroundColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: foregroundColor, width: 1),
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: AppItem.refresh,
                      child: Text(
                        'Refresh',
                        style: TextStyle(
                          color: foregroundColor,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: AppItem.send,
                      child: Text(
                        'Send Google Feedback',
                        style: TextStyle(
                          color: foregroundColor,
                        ),
                      ),
                    ),
                  ];
                },
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size(width, 2),
              child: Divider(
                height: 2,
                color: foregroundColor,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: isDark ? Colors.yellow : Colors.blue,
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () => isDark
                ? context.read<DarkModeController>().changeToLight()
                : context.read<DarkModeController>().changeToDark(),
          ),
          drawer: Drawer(
            backgroundColor:
                isDark ? const Color.fromARGB(255, 23, 23, 23) : Colors.white,
            width: navWidth,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 25),
                  leading: Image.asset(
                    'assets/google_text.png',
                    fit: BoxFit.cover,
                    width: resWidth,
                  ),
                  title: Text(
                    'Classroom',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                //
                Divider(
                  height: 0.5,
                  color: isDark ? Colors.white : Colors.black,
                ),
                //
                for (int i = 0; i < navHeaderTitles.length; i++)
                  buildNavItem(navHeaderTitles[i], navHeaderIcons[i]),
                //
                Divider(
                  height: 0.5,
                  color: isDark ? Colors.white : Colors.black,
                ),
                //
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.07,
                    top: height * 0.02,
                  ),
                  child: Text(
                    'Enrolled',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                //
                SizedBox(
                  height: height * 0.02,
                ),
                //
                for (int i = 0; i < classRoomNames.length; i++)
                  NavRecycleItem(
                    text: classRoomNames[i],
                    url: backgrounds[i],
                    color: colors[i],
                    onPressed: () => Get.to(
                      () => InnerScreen(
                        title: classRoomNames[i],
                        background: backgrounds[i],
                        color: colors[i],
                      ),
                    ),
                  ),
                // NavRecycleItem(text: classRoomNames[0]),
                // NavRecycleItem(text: classRoomNames[1]),
                // NavRecycleItem(text: classRoomNames[2]),
                // NavRecycleItem(text: classRoomNames[3]),
                // NavRecycleItem(text: classRoomNames[4]),
                // NavRecycleItem(text: classRoomNames[5]),
                // NavRecycleItem(text: classRoomNames[6]),
                // NavRecycleItem(text: classRoomNames[7]),
                // NavRecycleItem(text: classRoomNames[8]),
                // NavRecycleItem(text: classRoomNames[9]),
                // NavRecycleItem(text: classRoomNames[10]),
                // NavRecycleItem(text: classRoomNames[11]),
                for (int i = 0; i < navFooterTitles.length; i++)
                  buildNavItem(navFooterTitles[i], navFooterIcons[i])
              ],
            ),
          ),
          body: RefreshIndicator(
            color: foregroundColor,
            backgroundColor: backgroundColor,
            displacement: 50,
            strokeWidth: 3,
            onRefresh: () async {},
            child: LayoutBuilder(builder: (_, constraints) {
              if (constraints.maxWidth > 700) {
                return Row(
                  children: [
                    SizedBox(
                      width: width * 0.3,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.only(left: 25),
                            leading: Image.asset(
                              'assets/google_text.png',
                              fit: BoxFit.cover,
                              width: resWidth,
                            ),
                            title: Text(
                              'Classroom',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 18,
                                color: isDark ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                          //
                          Divider(
                            height: 0.5,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          //
                          for (int i = 0; i < navHeaderTitles.length; i++)
                            buildNavItem(navHeaderTitles[i], navHeaderIcons[i]),
                          //
                          Divider(
                            height: 0.5,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          //
                          Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.07,
                              top: height * 0.02,
                            ),
                            child: Text(
                              'Enrolled',
                              style: TextStyle(
                                color: isDark ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                          //
                          SizedBox(
                            height: height * 0.02,
                          ),
                          //
                          for (int i = 0; i < classRoomNames.length; i++)
                            NavRecycleItem(
                              text: classRoomNames[i],
                              url: backgrounds[i],
                              color: colors[i],
                              onPressed: () => Get.to(
                                () => InnerScreen(
                                  title: classRoomNames[i],
                                  background: backgrounds[i],
                                  color: colors[i],
                                ),
                              ),
                            ),
                          // NavRecycleItem(text: classRoomNames[0]),
                          // NavRecycleItem(text: classRoomNames[1]),
                          // NavRecycleItem(text: classRoomNames[2]),
                          // NavRecycleItem(text: classRoomNames[3]),
                          // NavRecycleItem(text: classRoomNames[4]),
                          // NavRecycleItem(text: classRoomNames[5]),
                          // NavRecycleItem(text: classRoomNames[6]),
                          // NavRecycleItem(text: classRoomNames[7]),
                          // NavRecycleItem(text: classRoomNames[8]),
                          // NavRecycleItem(text: classRoomNames[9]),
                          // NavRecycleItem(text: classRoomNames[10]),
                          // NavRecycleItem(text: classRoomNames[11]),
                          for (int i = 0; i < navFooterTitles.length; i++)
                            buildNavItem(navFooterTitles[i], navFooterIcons[i])
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.7,
                      child: ListView.builder(
                        itemCount: classRoomNames.length,
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ).add(
                          const EdgeInsets.only(
                            top: 7,
                            bottom: 7,
                          ),
                        ),
                        itemBuilder: (context, index) {
                          var title = classRoomNames[index];
                          var tutor = tutors[index];
                          var background = backgrounds[index];
                          // final r = random.nextInt(7);
                          return SingleClassroomWidget(
                            title: title,
                            tutor: tutor,
                            background: background,
                            // color: colors[index],
                            onPressed: () => Get.to(
                              () => InnerScreen(
                                title: classRoomNames[index],
                                background: backgrounds[index],
                                color: colors[index],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              }
              return ListView.builder(
                itemCount: classRoomNames.length,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ).add(
                  const EdgeInsets.only(
                    top: 7,
                    bottom: 7,
                  ),
                ),
                itemBuilder: (context, index) {
                  var title = classRoomNames[index];
                  var tutor = tutors[index];
                  var background = backgrounds[index];
                  // final r = random.nextInt(7);
                  return SingleClassroomWidget(
                    title: title,
                    tutor: tutor,
                    background: background,
                    // color: colors[index],
                    onPressed: () => Get.to(
                      () => InnerScreen(
                        title: classRoomNames[index],
                        background: backgrounds[index],
                        color: colors[index],
                      ),
                    ),
                  );
                },
              );
            }),
            // child:
            //  ScreenTypeLayout(
            //   desktop: Row(
            //     children: [
            //       ,
            //       ListView.builder(
            //         itemCount: classRoomNames.length,
            //         scrollDirection: Axis.vertical,
            //         padding: const EdgeInsets.symmetric(
            //           horizontal: 10,
            //         ).add(
            //           const EdgeInsets.only(
            //             top: 7,
            //             bottom: 7,
            //           ),
            //         ),
            //         itemBuilder: (context, index) {
            //           var title = classRoomNames[index];
            //           var tutor = tutors[index];
            //           var background = backgrounds[index];
            //           // final r = random.nextInt(7);
            //           return SingleClassroomWidget(
            //             title: title,
            //             tutor: tutor,
            //             background: background,
            //             // color: colors[index],
            //             onPressed: () => Get.to(
            //               () => InnerScreen(
            //                 title: classRoomNames[index],
            //                 background: backgrounds[index],
            //                 color: colors[index],
            //               ),
            //             ),
            //           );
            //         },
            //       )
            //     ],
            //   ),
            //   mobile: ListView.builder(
            //     itemCount: classRoomNames.length,
            //     scrollDirection: Axis.vertical,
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 10,
            //     ).add(
            //       const EdgeInsets.only(
            //         top: 7,
            //         bottom: 7,
            //       ),
            //     ),
            //     itemBuilder: (context, index) {
            //       var title = classRoomNames[index];
            //       var tutor = tutors[index];
            //       var background = backgrounds[index];
            //       // final r = random.nextInt(7);
            //       return SingleClassroomWidget(
            //         title: title,
            //         tutor: tutor,
            //         background: background,
            //         // color: colors[index],
            //         onPressed: () => Get.to(
            //           () => InnerScreen(
            //             title: classRoomNames[index],
            //             background: backgrounds[index],
            //             color: colors[index],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ),
        ),
      );
    }));
  }
}
