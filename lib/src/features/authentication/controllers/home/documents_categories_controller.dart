import 'package:get/get.dart';
import 'package:ssedisdik/src/features/authentication/models/documents_categories_model.dart';
import 'package:ssedisdik/src/utils/api_service.dart';

class DocCategoriesController extends GetxController {
  final ApiService apiService = ApiService();
  final RxList<DocCategoriesModel> _categories = <DocCategoriesModel>[].obs;

  List<DocCategoriesModel> get categories => _categories;

  Future<void> fetchCategories() async {
    try {
      final fetchedCategories = await apiService.fetchDocumentCategories(
        term: ' ',
        take: 20, // your take value
        skip: 0, // your skip value
      );
      _categories.assignAll(fetchedCategories);
    } catch (error) {
      print('Error fetching categories: $error');
    }
  }
}
