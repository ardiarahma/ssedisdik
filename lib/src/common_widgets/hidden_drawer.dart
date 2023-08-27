import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/upload_documents/upload_document_screen.dart';
import 'package:ssedisdik/src/features/authentication/screens/login/login_screen.dart';
import 'package:ssedisdik/src/features/authentication/screens/validation_page/doc_page.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/home_screen.dart';
import 'package:ssedisdik/src/features/authentication/screens/profile/profile_screen.dart';
import 'package:ssedisdik/src/utils/api_service.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final List<ScreenHiddenDrawer> _pages = [];
  final ApiService apiService = ApiService();

  void logout() {
    // Clear authentication data, such as token
    // apiService.clearAuthToken();

    Get.offAll(const LoginScreen()); // Navigate back to LoginScreen
  }

  @override
  void initState() {
    // TODO: implement initState
    _pages.add(
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Beranda",
              baseStyle: const TextStyle(
                color: Colors.white,
              ),
              colorLineSelected: Colors.teal,
              selectedStyle: const TextStyle(color: Colors.white)),
          const HomePage()),
    );

    _pages.add(
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: "Profil",
              baseStyle: const TextStyle(
                color: Colors.white,
              ),
              colorLineSelected: Colors.red,
              selectedStyle: const TextStyle(color: Colors.white)),
          const ProfilePage()),
    );

    _pages.add(
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Validasi",
            baseStyle: const TextStyle(
              color: Colors.white,
            ),
            colorLineSelected: Colors.orange,
            selectedStyle: const TextStyle(color: Colors.white),
          ),
          const DocumentPage()),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: HiddenDrawerMenu(
          screens: _pages,
          backgroundColorMenu: primaryColor,
          initPositionSelected: 0,
          contentCornerRadius: 30,
          slidePercent: 50,
          elevationAppBar: 0,
          actionsAppBar: [
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
                //do something here
              },
            )
          ],
          leadingAppBar: const Icon(
            Icons.more_vert_rounded,
            color: Colors.white,
          ),
          enableScaleAnimation: true,
          backgroundColorAppBar: primaryColor,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => const UploadScreen()),
          backgroundColor: buttonColor,
          child: const Icon(
            Icons.file_present_rounded,
            color: Colors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
