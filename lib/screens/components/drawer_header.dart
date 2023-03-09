import 'package:flutter/material.dart';
import 'package:ssedisdik/constants.dart';

class MyDrawerHeader extends StatefulWidget {
  @override
  State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      width: double.infinity,
      height: 150,
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/user.png'))),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "namanya siapa",
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          Text(
            "DINAS PENDIDIKAN",
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
