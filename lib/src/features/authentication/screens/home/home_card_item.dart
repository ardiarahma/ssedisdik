import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({super.key});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: 50,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(0, 10))
          ],
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Stack(
          // ini nanti isinya 'Total Permintaan TTE'
          ),
    );
  }
}
