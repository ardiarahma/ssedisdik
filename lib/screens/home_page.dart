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
          height: size.height * 0.1,
          width: size.width * 1,
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Stack(
            children: [
              Container(
                child: Text('Sistem Sertifikat Elektronik',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 20)),
                padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              )
            ],
          ),
        ),
        Container(
          height: size.height * 0.1,
          width: size.width * 1,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          decoration: BoxDecoration(color: Colors.blue[200]),
          child: Stack(
              // ini nanti isinya 'Total Permintaan TTE'
              ),
        ),
        Container(
          height: size.height * 0.1,
          width: size.width * 1,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(color: Colors.teal[200]),
          child: Stack(
              // ini nanti isinya 'Belum TTE'
              ),
        ),
        Container(
          height: size.height * 0.1,
          width: size.width * 1,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(color: Colors.orange[200]),
          child: Stack(
              // ini nanti isinya 'Selesai TTE'
              ),
        ),
        Container(
          height: size.height * 0.1,
          width: size.width * 1,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(color: Colors.red[200]),
          child: Stack(
              // ini nanti isinya 'Tolak TTE'
              ),
        ),
      ],
    );
  }
}
