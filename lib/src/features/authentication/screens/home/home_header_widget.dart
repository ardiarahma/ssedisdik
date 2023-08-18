import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/image_strings.dart';
import 'package:ssedisdik/src/constants/text_strings.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({super.key, required this.size});

  final Size size;

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
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

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Container(
      // height: size.height * 0.15,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        color: primaryColor,
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15),
                child: Image(
                    image: const AssetImage(logoSseOnly),
                    height: widget.size.height * 0.5),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tGreeting + userData['name'],
                        style: txtTheme.displayMedium
                            ?.copyWith(color: Colors.white, fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        tGreetingSub,
                        style: txtTheme.displaySmall?.copyWith(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
