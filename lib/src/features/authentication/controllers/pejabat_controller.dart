import 'package:get/get.dart';
import 'package:ssedisdik/main.dart';
import 'package:ssedisdik/src/features/authentication/models/pejabat_model.dart';
import 'package:ssedisdik/src/utils/api_service.dart';

class PejabatController extends GetxController {
  final ApiService apiService = ApiService();
  final RxList<PejabatModel> _pejabatTte = <PejabatModel>[].obs;

  RxList<PejabatModel> get pejabatTte => _pejabatTte;

  Future<void> fetchPejabat(String selectedUnitKerjaId) async {
    try {
      final fetchPejabatTte = await apiService.fetchPejabat(
        term: ' ',
        take: 50, // your take value
        skip: 0,
        group: selectedUnitKerjaId,
      );
      _pejabatTte.assignAll(fetchPejabatTte);
    } catch (error) {
      logger.e('Error fetching pejabat : $error');
    }
  }
}
