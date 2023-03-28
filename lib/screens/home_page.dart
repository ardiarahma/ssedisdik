import 'package:flutter/material.dart';
import 'package:ssedisdik/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.11,
          width: size.width * 1,
          padding: EdgeInsets.only(bottom: 10),
          // decoration: BoxDecoration(
          //     color: Colors.white,
          //     boxShadow: [BoxShadow(blurRadius: 25, color: primaryColor, offset: Offset(0, 25))],
          //     borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(20),
          //         bottomRight: Radius.circular(20))),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Text(
                            'Halo,',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Text(
                            'Selamat datang di SSEDISDIK!',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: primaryColor),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
        Container(
          height: size.height * 0.2,
          width: size.width * 1,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 10, offset: Offset(0, 10))
              ],
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Stack(
              // ini nanti isinya 'Total Permintaan TTE'
              ),
        ),
        Container(
          height: size.height * 0.2,
          width: size.width * 1,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 10, offset: Offset(0, 10))
              ],
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Stack(
              // ini nanti isinya 'Belum TTE'
              ),
        ),
        Container(
          height: size.height * 0.2,
          width: size.width * 1,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 10, offset: Offset(0, 10))
              ],
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Stack(
              // ini nanti isinya 'Selesai TTE'
              ),
        ),
        Container(
          height: size.height * 0.2,
          width: size.width * 1,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, blurRadius: 10, offset: Offset(0, 10))
              ],
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Stack(
              // ini nanti isinya 'Tolak TTE'
              ),
        ),
      ],
    );
  }
}
