import 'package:flutter/material.dart';
import 'package:ssedisdik/src/features/authentication/models/type_model.dart';

class TypeDropdownButton extends StatefulWidget {
  final List<TypeModel> types;
  const TypeDropdownButton({super.key, required this.types});

  @override
  State<TypeDropdownButton> createState() => _TypeDropdownButtonState();
}

class _TypeDropdownButtonState extends State<TypeDropdownButton> {
  TypeModel? selectedOrientation;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final txtTheme = Theme.of(context).textTheme;
    return Container(
      width: size.width * 0.15,
      decoration: BoxDecoration(
          color: const Color.fromARGB(237, 238, 238, 238),
          borderRadius: BorderRadius.circular(20.0)),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InputDecorator(
        decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.zero),
        child: DropdownButtonFormField<TypeModel>(
          value: selectedOrientation,
          style: txtTheme.displaySmall?.copyWith(fontSize: 14),
          decoration: const InputDecoration.collapsed(hintText: ""),
          isExpanded: true,
          items: widget.types.map((TypeModel types) {
            return DropdownMenuItem<TypeModel>(
              value: types,
              child: Text(types.type),
            );
          }).toList(),
          onChanged: (TypeModel? newValue) {
            setState(() {
              selectedOrientation = newValue;
            });
          },
          hint: const Text(' -- Pilih Jenis -- '),
        ),
      ),
    );
  }
}