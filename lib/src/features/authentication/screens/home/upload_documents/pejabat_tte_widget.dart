import 'package:flutter/material.dart';
import 'package:ssedisdik/src/features/authentication/models/pejabat_model.dart';

class PejabatPenandatanganButton extends StatefulWidget {
  final PejabatModel? selectedPejabat;
  final List<PejabatModel> pejabats;
  final ValueChanged<PejabatModel?> onChanged;
  final String? selectedUnitKerjaId;

  const PejabatPenandatanganButton({
    super.key,
    required this.pejabats,
    required this.selectedPejabat,
    required this.onChanged,
    this.selectedUnitKerjaId,
  });

  @override
  State<PejabatPenandatanganButton> createState() =>
      _PejabatPenandatanganButtonState();
}

class _PejabatPenandatanganButtonState
    extends State<PejabatPenandatanganButton> {
  PejabatModel? selectedPejabat;

  @override
  void initState() {
    super.initState();
    selectedPejabat = widget.selectedPejabat;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final txtTheme = Theme.of(context).textTheme;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(237, 238, 238, 238),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InputDecorator(
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        child: DropdownButtonFormField<PejabatModel>(
          value: selectedPejabat,
          style: txtTheme.displaySmall?.copyWith(fontSize: 14),
          decoration: const InputDecoration.collapsed(hintText: ""),
          isExpanded: true,
          items: widget.pejabats.map((PejabatModel pejabat) {
            return DropdownMenuItem<PejabatModel>(
              value: pejabat,
              child: Text(pejabat.name),
            );
          }).toList(),
          onChanged: (selectedValue) {
            setState(() {
              selectedPejabat = selectedValue;
            });
            widget.onChanged(selectedValue);
          },
          hint: widget.pejabats.isEmpty
              ? const Text('No Pejabat Available')
              : const Text(' -- Pilih Pejabat TTE -- '),
          // Disabling the dropdown when no items are available
          onTap: widget.pejabats.isEmpty ? null : () {},
        ),
      ),
    );
  }
}
