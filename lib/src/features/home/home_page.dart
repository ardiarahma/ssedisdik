import 'package:flutter/material.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/features/home/home_card_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
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
          decoration:
              const BoxDecoration(border: Border(left: BorderSide(width: 4))),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(tHomePage, style: txt,)
            ],
          ),
        )
        // GridView.count(
        //   crossAxisCount: 4,
        //   scrollDirection: Axis.horizontal,
        //   children: [ItemCard()],
        // )
      ],
    );
  }
}

class ItemGridHorizontal extends StatefulWidget {
  const ItemGridHorizontal({super.key});

  @override
  State<ItemGridHorizontal> createState() => _ItemGridHorizontalState();
}

class _ItemGridHorizontalState extends State<ItemGridHorizontal> {
  final List<Map<String, dynamic>> gridMap = [
    {"title": "Total Permintaan TTE", "jumlah": 10},
    {"title": "Belum di TTE", "jumlah": 10},
    {"title": "Sudah di TTE", "jumlah": 10},
    {"title": "Ditolak", "jumlah": 10}
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      children: [
        // ItemCard(),
        Container(
          height: size.height * 0.2,
          width: 50,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          decoration: BoxDecoration(
              color: Colors.red,
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
          width: 50,
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
          width: 50,
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
          width: 50,
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
        )
      ],
    );
  }
}
