import 'package:get/get.dart';
import 'package:ssedisdik/src/features/authentication/models/documents_categories_model.dart';

class DocCategoriesController extends GetxController {
  final List<DocCategoriesModel> _categories = [
    DocCategoriesModel(
      categoryId: 1,
      docCategory: "Surat Pernyataan",
    ),
    DocCategoriesModel(
      categoryId: 2,
      docCategory: "Surat Undangansssssssssssssss",
    ),
    DocCategoriesModel(
      categoryId: 3,
      docCategory: "Surat Permohonan",
    ),
    // Tambahkan kategori lainnya di sini
  ];

  List<DocCategoriesModel> get categories => _categories;
}