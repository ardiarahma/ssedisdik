import 'package:get/get.dart';
import 'package:ssedisdik/src/features/authentication/models/documents_model.dart';
import 'package:ssedisdik/src/utils/api_service.dart';

class DocumentsController extends GetxController {
  final ApiService _apiService = ApiService();
  RxList<DocumentsModel> documentsList = <DocumentsModel>[].obs;
  int currentPage = 1;
  int itemsPerPage = 5; // Adjust as needed
  RxString searchTerm = ''.obs; // Make searchTerm reactive
  String? filterStatus;
  RxBool isFetching = false.obs;

  Future<void> fetchDocuments() async {
    try {
      print('Fetching documents..');
      isFetching.value = true; // Set isFetching to true before fetching
      final newDocuments = await _apiService.fetchPaginatedAndFilteredDocuments(
        page: currentPage,
        take: itemsPerPage,
        skip: (currentPage - 1) * itemsPerPage,
        term: searchTerm.value, // Use the value of the searchTerm observable
        status: filterStatus,
      );
      documentsList.addAll(newDocuments);
      currentPage++;
      // Perform the API call and data processing
      isFetching.value = false; 
      // Set isFetching back to false after fetching
      print('Documents has fetched');
    } catch (error) {
      // Handle error and set isFetching back to false
      isFetching.value = false;
      print('Error fetching documents: $error + data tidak muncul');
    }
  }

  void updateSearchTerm(String term) {
    searchTerm.value = term; // Update the reactive searchTerm value
    resetPageAndFetchDocuments(); // Reset page and fetch new documents
  }

  void resetPageAndFetchDocuments() {
    currentPage = 1;
    documentsList.clear();
    fetchDocuments(); // Fetch documents with the new search term
  }

  void updateFilterStatus(String? status) {
    filterStatus = status;
  }
}
