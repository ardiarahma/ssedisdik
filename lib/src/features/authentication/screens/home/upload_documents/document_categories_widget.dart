import 'package:flutter/material.dart';
import 'package:ssedisdik/src/features/authentication/models/documents_categories_model.dart';

class CategoryDropdownButton extends StatefulWidget {
  final DocCategoriesModel? selectedCategory;
  final List<DocCategoriesModel> categories;
  final ValueChanged<DocCategoriesModel?> onChanged;

  const CategoryDropdownButton({super.key, 
    required this.selectedCategory,
    required this.categories,
    required this.onChanged,
  });
  @override
  State<CategoryDropdownButton> createState() => _CategoryDropdownButtonState();
}

class _CategoryDropdownButtonState extends State<CategoryDropdownButton> {
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
        decoration: const InputDecoration(
            border: InputBorder.none, contentPadding: EdgeInsets.zero),
        child: DropdownButtonFormField<DocCategoriesModel>(
          value: widget.selectedCategory,
          style: txtTheme.displaySmall?.copyWith(fontSize: 14),
          decoration: const InputDecoration.collapsed(hintText: ""),
          isExpanded: true,
          items: widget.categories.map((category) {
            return DropdownMenuItem<DocCategoriesModel>(
              value: category,
              child: Text(category.name), // Adjust this based on your model
            );
          }).toList(),
          onChanged: widget.onChanged,
          hint: const Text(' -- Pilih Kategori -- '),
        ),
      ),
    );
  }
}
