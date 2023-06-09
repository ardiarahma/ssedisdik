import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/features/document/doc_page.dart';
import 'package:ssedisdik/src/features/home/home_page.dart';
import 'package:ssedisdik/src/features/profile/profile_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    // TODO: implement initState
    _pages.add(
      new ScreenHiddenDrawer(
          new ItemHiddenMenu(
              name: "Beranda",
              baseStyle: TextStyle(
                color: Colors.white,
              ),
              colorLineSelected: Colors.teal,
              selectedStyle: TextStyle(color: Colors.white)),
          HomePage()),
    );

    _pages.add(
      new ScreenHiddenDrawer(
          new ItemHiddenMenu(
              name: "Profil",
              baseStyle: TextStyle(
                color: Colors.white,
              ),
              colorLineSelected: Colors.red,
              selectedStyle: TextStyle(color: Colors.white)),
          ProfilePage()),
    );

    _pages.add(
      new ScreenHiddenDrawer(
          new ItemHiddenMenu(
            name: "Dokumen",
            baseStyle: TextStyle(
              color: Colors.white,
            ),
            colorLineSelected: Colors.orange,
            selectedStyle: TextStyle(color: Colors.white),
          ),
          DocumentPage()),
    );

    _pages.add(
      new ScreenHiddenDrawer(
          new ItemHiddenMenu(
              name: "Keluar",
              baseStyle: TextStyle(
                color: Colors.white,
              ),
              colorLineSelected: Colors.lightBlue,
              selectedStyle: TextStyle(color: Colors.white)),
          HomePage()),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorMenu: primaryColor,
      initPositionSelected: 0,
      contentCornerRadius: 30,
      slidePercent: 50,
      elevationAppBar: 0,
      actionsAppBar: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: primaryColor,
          ),
          onPressed: () {
            //do something here
          },
        )
      ],
      leadingAppBar: const Icon(
        Icons.more_vert_rounded,
        color: primaryColor,
      ),
      backgroundColorAppBar: Colors.white,
      tittleAppBar: Center(
          // child: Text('SSEDISDIK'),
          ),
    );
  }
}
