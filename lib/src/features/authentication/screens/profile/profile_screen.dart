import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/features/authentication/screens/login/login_screen.dart';
import 'package:ssedisdik/src/features/authentication/screens/profile/profile_edit_screen.dart';
import 'package:ssedisdik/src/utils/api_service.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ApiService apiService = ApiService();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    final userDataString = await _secureStorage.read(key: 'userData');
    if (userDataString != null) {
      setState(() {
        userData = jsonDecode(userDataString);
      });
    }
  }

  void _handleLogout() async {
    try {
      await apiService.logout();
      Get.off(LoginScreen());
      print('logout successful');
    } catch (error) {
      print('logout unsuccessful');
      throw Exception('Logout error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final txtTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            WaveWidget(
                config: CustomConfig(colors: [
                  Colors.white,
                  Colors.white54,
                  Colors.white30,
                  Colors.white24,
                ], durations: [
                  32000,
                  21000,
                  18000,
                  5000
                ], heightPercentages: [
                  0.06,
                  0.07,
                  0.09,
                  0.12
                ]),
                backgroundColor: primaryColor,
                size: Size(double.maxFinite, double.infinity)),
            Padding(
              padding: const EdgeInsets.only(
                  left: tHomePadding, right: tHomePadding),
              child: Column(
                children: [
                  // -- User Name
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(tDefaultSize),
                      child: Text(
                        userData['name'],
                        style: txtTheme.displayLarge?.copyWith(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // -- Ends of User Name

                  const SizedBox(height: 80),

                  // -- Edit Profile Content
                  Container(
                    height: size.height * 0.06,
                    width: size.width,
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text("Pembaruan Data",
                                style: txtTheme.displayLarge?.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          InkWell(
                            onTap: () =>
                                Get.to(() => const ProfileEditScreen()),
                            child: Icon(
                              Icons.arrow_right_rounded,
                              size: 35.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // -- Ends of Edit Profile Content

                  const SizedBox(height: tHomePadding),

                  // -- Fingerprint Settings
                  Container(
                    height: size.height * 0.06,
                    width: size.width,
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text("Atur Sidik Jari",
                                style: txtTheme.displayLarge?.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_right_rounded,
                                size: 35.0,
                              ))
                        ],
                      ),
                    ),
                  ),
                  // -- Ends of Fingerprint Settings

                  const SizedBox(height: 50.0),

                  // -- Detail Profile
                  Padding(
                    padding: const EdgeInsets.only(
                        left: tHomePadding, right: tHomePadding),
                    child: Column(
                      children: [
                        Text("Nomor Induk Kependudukan",
                            textAlign: TextAlign.left,
                            style: txtTheme.displayLarge?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: tHomePadding),
                        Text(userData['nik'] ?? "No Data",
                            textAlign: TextAlign.left,
                            style:
                                txtTheme.displayLarge?.copyWith(fontSize: 14)),
                        const SizedBox(height: tHomePadding),
                        Text("Nomor Telepon",
                            textAlign: TextAlign.left,
                            style: txtTheme.displayLarge?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: tHomePadding),
                        Text(userData['noHp'],
                            textAlign: TextAlign.left,
                            style:
                                txtTheme.displayLarge?.copyWith(fontSize: 14)),
                        const SizedBox(height: tHomePadding),
                        Text("Alamat Email",
                            textAlign: TextAlign.left,
                            style: txtTheme.displayLarge?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: tHomePadding),
                        Text(userData['email'],
                            style:
                                txtTheme.displayLarge?.copyWith(fontSize: 14)),
                        const SizedBox(height: tHomePadding),
                        Text("Unit Kerja",
                            textAlign: TextAlign.left,
                            style: txtTheme.displayLarge?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: tHomePadding),
                        Text(userData['group']['name'],
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style:
                                txtTheme.displayLarge?.copyWith(fontSize: 14)),
                        const SizedBox(height: tHomePadding),
                        Text("Jabatan",
                            softWrap: true,
                            textAlign: TextAlign.left,
                            style: txtTheme.displayLarge?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: tHomePadding),
                        Text(userData['position']['name'],
                            textAlign: TextAlign.left,
                            style:
                                txtTheme.displayLarge?.copyWith(fontSize: 14)),
                        const SizedBox(height: tHomePadding),
                      ],
                    ),
                  ),
                  // -- Ends of Detail Profile

                  const SizedBox(height: 5.0),

                  // -- Logout Button
                  Flexible(
                    child: Container(
                      height: 45,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        onPressed: _handleLogout,
                        icon: Icon(Icons.logout_rounded),
                        label: Text(
                          "Keluar",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  // -- Ends of Logout Button
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
