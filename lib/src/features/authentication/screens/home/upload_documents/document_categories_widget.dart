import 'package:flutter/material.dart';
import 'package:ssedisdik/src/features/authentication/models/documents_categories_model.dart';

class CategoryDropdownButton extends StatefulWidget {
  final List<DocCategoriesModel> categories;
  const CategoryDropdownButton({super.key, required this.categories});

  @override
  State<CategoryDropdownButton> createState() => _CategoryDropdownButtonState();
}

class _CategoryDropdownButtonState extends State<CategoryDropdownButton> {
  DocCategoriesModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final txtTheme = Theme.of(context).textTheme;
    return Container(
      width: size.width * 0.6,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20.0)),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InputDecorator(
        decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.zero),
        child: DropdownButtonFormField<DocCategoriesModel>(
          value: selectedCategory,
          style: txtTheme.displaySmall?.copyWith(fontSize: 14),
          decoration: const InputDecoration.collapsed(hintText: ""),
          isExpanded: true,
          items: widget.categories.map((DocCategoriesModel category) {
            return DropdownMenuItem<DocCategoriesModel>(
              value: category,
              child: Text(category.docCategory),
            );
          }).toList(),
          onChanged: (DocCategoriesModel? newValue) {
            setState(() {
              selectedCategory = newValue;
            });
          },
          hint: const Text(' -- Pilih Kategori -- '),
        ),
      ),
    );
  }
}
