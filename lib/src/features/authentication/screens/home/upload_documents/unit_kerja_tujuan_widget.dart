import 'package:flutter/material.dart';
import 'package:ssedisdik/src/features/authentication/models/unit_kerja_model.dart';

class UnitKerjaTujuanButton extends StatefulWidget {
  final List<UnitKerjaModel> units;
  const UnitKerjaTujuanButton({super.key, required this.units});

  @override
  State<UnitKerjaTujuanButton> createState() => _UnitKerjaTujuanButtonState();
}

class _UnitKerjaTujuanButtonState extends State<UnitKerjaTujuanButton> {
  UnitKerjaModel? selectedUnitKerja;
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
        child: DropdownButtonFormField<UnitKerjaModel>(
          value: selectedUnitKerja,
          style: txtTheme.displaySmall?.copyWith(fontSize: 14),
          decoration: const InputDecoration.collapsed(hintText: ""),
          isExpanded: true,
          items: widget.units.map((UnitKerjaModel unitsKerja) {
            return DropdownMenuItem<UnitKerjaModel>(
              value: unitsKerja,
              child: Text(unitsKerja.unitKerja),
            );
          }).toList(),
          onChanged: (UnitKerjaModel? newValue) {
            setState(() {
              selectedUnitKerja = newValue;
            });
          },
          hint: const Text(' -- Pilih Unit Kerja Tujuan -- '),
        ),
      ),
    );
  }
}