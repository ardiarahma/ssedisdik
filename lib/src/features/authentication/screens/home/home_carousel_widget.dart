import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/constants/sizes.dart';
import 'package:ssedisdik/src/features/authentication/models/response/home_carousel_response.dart';
import 'package:ssedisdik/src/utils/api_service.dart';

class HomeCarouselWidget extends StatefulWidget {
  const HomeCarouselWidget({super.key, required this.carouselData, required this.refreshCallback});
  final List<String> carouselData;
  final VoidCallback refreshCallback;

  @override
  State<HomeCarouselWidget> createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {
  Map<int, String> statusMap = {
    1: "Dokumen Terkirim",
    2: "Selesai TTE",
    3: "Dokumen Ditolak",
    4: "Draft Dokumen",
  };

  List<MapEntry<String, String>> carouselItems = [];
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await ApiService().fetchCarouselData();
      final homeCarouselResponse = HomeCarouselResponse.fromJson(response);

      carouselItems = homeCarouselResponse.docResults.entries.map((entry) {
        final statusNumeric = int.parse(entry.key);
        print("Status Numeric: $statusNumeric");
        final statusText = statusMap[statusNumeric] ?? 'Unknown Status';
        print("Status Text: $statusText");
        final count = entry.value.toString();
        print("Count: $count");
        return MapEntry(statusText, count);
      }).toList();

      setState(() {});
    } catch (error) {
      // Handle error
    }
  }

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
            items: carouselItems.map((item) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 45.0),
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
                child: Column(
                  children: [
                    Text(
                      item.key, // Status text
                      style: txtTheme.displayMedium
                          ?.copyWith(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      item.value, // Count
                      style: txtTheme.displayLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }).toList(),
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
            for (int i = 0; i < carouselItems.length; i++)
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
