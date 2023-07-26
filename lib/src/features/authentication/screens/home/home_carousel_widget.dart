import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/sizes.dart';

class HomeCarouselWidget extends StatefulWidget {
  const HomeCarouselWidget({super.key});

  @override
  State<HomeCarouselWidget> createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  List itemColors = [
    blue_pallete_1,
    blue_pallete_2,
    blue_pallete_3,
    blue_pallete_4
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.2,
          width: double.infinity,
          child: CarouselSlider(
            items: [
              for (int i = 0; i < itemColors.length; i++)
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: tHomePadding, horizontal: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(1, 1))
                      ]),
                  child: Text(
                    'Total Dokumen',
                    style: txtTheme.displayMedium
                        ?.copyWith(color: Colors.white, fontSize: 15),
                  ),
                )
            ],
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  print(reason.toString());
                  currentIndex = index;
                });
              },
              aspectRatio: 2.0,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < itemColors.length; i++)
              Container(
                height: 10,
                width: 10,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: currentIndex == i ? primaryColor : Colors.grey,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(1, 1))
                    ]),
              )
          ],
        )
      ],
    );
  }
}
