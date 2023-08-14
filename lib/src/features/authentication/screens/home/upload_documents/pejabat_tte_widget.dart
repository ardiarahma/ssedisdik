import 'package:flutter/material.dart';
import 'package:ssedisdik/src/features/authentication/models/pejabat_model.dart';

class PejabatPenandatanganButton extends StatefulWidget {
  final List<PejabatModel> pejabats;
  const PejabatPenandatanganButton({super.key, required this.pejabats});

  @override
  State<PejabatPenandatanganButton> createState() => _PejabatPenandatanganButtonState();
}

class _PejabatPenandatanganButtonState extends State<PejabatPenandatanganButton> {
  PejabatModel? selectedPejabat;
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
        child: DropdownButtonFormField<PejabatModel>(
          value: selectedPejabat,
          style: txtTheme.displaySmall?.copyWith(fontSize: 14),
          decoration: const InputDecoration.collapsed(hintText: ""),
          isExpanded: true,
          items: widget.pejabats.map((PejabatModel pejabats) {
            return DropdownMenuItem<PejabatModel>(
              value: pejabats,
              child: Text(pejabats.pejabat),
            );
          }).toList(),
          onChanged: (PejabatModel? newValue) {
            setState(() {
              selectedPejabat = newValue;
            });
          },
          hint: const Text(' -- Pilih Pejabat TTE -- '),
        ),
      ),
    );
  }
}