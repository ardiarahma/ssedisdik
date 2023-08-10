import 'package:flutter/material.dart';
import 'package:ssedisdik/src/features/authentication/models/orientation_model.dart';

class OrientationDropdownButton extends StatefulWidget {
  final List<OrientationModel> orientations;
  const OrientationDropdownButton({super.key, required this.orientations});

  @override
  State<OrientationDropdownButton> createState() => _OrientationDropdownButtonState();
}

class _OrientationDropdownButtonState extends State<OrientationDropdownButton> {
  OrientationModel? selectedOrientation;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final txtTheme = Theme.of(context).textTheme;
    return Container(
      width: size.width * 0.18,
      decoration: BoxDecoration(
          color: const Color.fromARGB(237, 238, 238, 238),
          borderRadius: BorderRadius.circular(20.0)),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InputDecorator(
        decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.zero),
        child: DropdownButtonFormField<OrientationModel>(
          value: selectedOrientation,
          style: txtTheme.displaySmall?.copyWith(fontSize: 14),
          decoration: const InputDecoration.collapsed(hintText: ""),
          isExpanded: true,
          items: widget.orientations.map((OrientationModel orientations) {
            return DropdownMenuItem<OrientationModel>(
              value: orientations,
              child: Text(orientations.orientation),
            );
          }).toList(),
          onChanged: (OrientationModel? newValue) {
            setState(() {
              selectedOrientation = newValue;
            });
          },
          hint: const Text(' -- Pilih Posisi -- '),
        ),
      ),
    );
  }
}