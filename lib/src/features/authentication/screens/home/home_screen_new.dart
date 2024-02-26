import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:ssedisdik/main.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';
import 'package:ssedisdik/src/features/authentication/screens/home/home_header_widget.dart';
import 'package:ssedisdik/src/features/authentication/screens/login/login_screen.dart';
import 'package:ssedisdik/src/features/authentication/screens/profile/profile_edit_screen.dart';
import 'package:ssedisdik/src/utils/api_service.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:intl/intl.dart';

import '../../controllers/login/session_controller.dart';

class HomePageNew extends StatefulWidget {
  const HomePageNew({super.key});

  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  final ApiService apiService = ApiService();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  Map<String, dynamic> userData = {};
  late BuildContext _sessionContext;

  @override
  void initState() {
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
    // final sessionManager =
    //     Provider.of<SessionManager>(_sessionContext, listen: false);
    // sessionManager.resetSessionTimeoutTimer();
    // logger.i("nik value: ${userData['nik']}");
  }

  @override
  Widget build(BuildContext context) {
    _sessionContext = context;
    final size = MediaQuery.of(context).size;
    final txtTheme = Theme.of(context).textTheme;
    final numberFormat = NumberFormat('#,##0', 'en_US');

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
                  0.17,
                  0.18,
                  0.2,
                  0.23
                ]),
                backgroundColor: primaryColor,
                size: const Size(double.maxFinite, double.infinity)),
            Padding(
              padding: const EdgeInsets.only(
                  left: tHomePadding, right: tHomePadding),
              child: Column(
                children: [
                  // -- Header
                  const SizedBox(height: 20),
                  HomeHeaderWidget(
                      size: Size(double.infinity, size.height * 0.15)),
                  // -- Ends of Header

                  const SizedBox(height: 30),

                  // -- Info
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(7.0),
                      height: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: blue_pallete_2),
                          borderRadius: BorderRadius.circular(15.0),
                          color: powderBlue),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.info_outline_rounded,
                                color: Colors.red,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 7.0, top: 2.0),
                                child: Text(tInfoSse,
                                    style: txtTheme.displayLarge?.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 10.0),
                            child: Text("Sementara ini tidak ada informasi."),
                          )
                        ],
                      ),
                    ),
                  ),
                  // -- End of Info

                  const SizedBox(height: 20),

                  // -- Document Status
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            height: size.height * 0.25,
                            child: Material(
                                elevation: 4.0,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0)),
                                color: Colors.white,
                                child: Stack(fit: StackFit.expand, children: [
                                  Align(
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30.0),
                                      child: Opacity(
                                        opacity: 0.45,
                                        child: Image.asset(
                                          'assets/images/lowpoly.png', // Replace with your image path
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20.0, left: 20.0),
                                        child: Center(
                                          child: Text(
                                              numberFormat.format(00000000),
                                              textAlign: TextAlign.center,
                                              style: txtTheme.displayLarge
                                                  ?.copyWith(
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 20.0),
                                        child: Center(
                                          child: Text("Dokumen Terkirim",
                                              textAlign: TextAlign.center,
                                              style: txtTheme.displaySmall
                                                  ?.copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ])),
                          )),
                          const SizedBox(width: 20),
                          Expanded(
                            child: SizedBox(
                              height: size.height * 0.25,
                              child: Material(
                                  elevation: 4.0,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0)),
                                  color: Colors.white,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          child: Opacity(
                                            opacity: 0.45,
                                            child: Image.asset(
                                              'assets/images/lowpoly.png', // Replace with your image path
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20.0, left: 20.0),
                                            child: Center(
                                              child: Text(
                                                  numberFormat.format(00000000),
                                                  textAlign: TextAlign.left,
                                                  style: txtTheme.displayLarge
                                                      ?.copyWith(
                                                          fontSize: 28,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, right: 20.0),
                                            child: Center(
                                              child: Text("Selesai TTE",
                                                  textAlign: TextAlign.center,
                                                  style: txtTheme.displaySmall
                                                      ?.copyWith(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            height: size.height * 0.25,
                            child: Material(
                                elevation: 4.0,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0)),
                                color: Colors.white,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: Opacity(
                                          opacity: 0.45,
                                          child: Image.asset(
                                            'assets/images/lowpoly.png', // Replace with your image path
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20.0, left: 20.0),
                                          child: Center(
                                            child: Text(
                                                numberFormat.format(00000000),
                                                textAlign: TextAlign.left,
                                                style: txtTheme.displayLarge
                                                    ?.copyWith(
                                                        fontSize: 28,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, right: 20.0),
                                          child: Center(
                                            child: Text("Dokumen Ditolak",
                                                textAlign: TextAlign.center,
                                                style: txtTheme.displaySmall
                                                    ?.copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          )),
                          const SizedBox(width: 20),
                          Expanded(
                            child: SizedBox(
                              height: size.height * 0.25,
                              child: Material(
                                  elevation: 4.0,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0)),
                                  color: Colors.white,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          child: Opacity(
                                            opacity: 0.45,
                                            child: Image.asset(
                                              'assets/images/lowpoly.png', // Replace with your image path
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20.0, left: 20.0),
                                            child: Center(
                                              child: Text(
                                                  numberFormat.format(00000000),
                                                  textAlign: TextAlign.left,
                                                  style: txtTheme.displayLarge
                                                      ?.copyWith(
                                                          fontSize: 28,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, right: 20.0),
                                            child: Center(
                                              child: Text("Draft Dokumen",
                                                  textAlign: TextAlign.center,
                                                  style: txtTheme.displaySmall
                                                      ?.copyWith(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
