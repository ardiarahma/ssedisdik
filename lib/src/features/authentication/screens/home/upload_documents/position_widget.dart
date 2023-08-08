import 'package:flutter/material.dart';
import 'package:ssedisdik/src/features/authentication/models/position_model.dart';
import 'package:ssedisdik/src/features/authentication/models/unit_kerja_model.dart';

class PositionDropdownButton extends StatefulWidget {
  final List<PositionModel> positions;
  const PositionDropdownButton({super.key, required this.positions});

  @override
  State<PositionDropdownButton> createState() => _PositionDropdownButtonState();
}

class _PositionDropdownButtonState extends State<PositionDropdownButton> {
  PositionModel? selectedPosition;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final txtTheme = Theme.of(context).textTheme;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          color: const Color.fromARGB(237, 238, 238, 238),
          borderRadius: BorderRadius.circular(20.0)),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InputDecorator(
        decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.zero),
        child: DropdownButtonFormField<PositionModel>(
          value: selectedPosition,
          style: txtTheme.displaySmall?.copyWith(fontSize: 14),
          decoration: const InputDecoration.collapsed(hintText: ""),
          isExpanded: true,
          items: widget.positions.map((PositionModel positionsKerja) {
            return DropdownMenuItem<PositionModel>(
              value: positionsKerja,
              child: Text(positionsKerja.position),
            );
          }).toList(),
          onChanged: (PositionModel? newValue) {
            setState(() {
              selectedPosition = newValue;
            });
          },
          hint: const Text(' -- Pilih Posisi -- '),
        ),
      ),
    );
  }
}