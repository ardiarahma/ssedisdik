import 'package:get/get.dart';
import 'package:ssedisdik/src/features/authentication/models/unit_kerja_model.dart';
import 'package:ssedisdik/src/utils/api_service.dart';

class UnitKerjaController extends GetxController {
  final ApiService apiService = ApiService();
  final RxList<UnitKerjaModel> _unitKerja = <UnitKerjaModel>[].obs;

  List<UnitKerjaModel> get unitKerja => _unitKerja;

  Future<void> fetchUnitKerja() async {
    try {
      final fetchUnitKerja = await apiService.fetchUnitKerja(
        term: ' ',
        take: 50, // your take value
        skip: 0, // your skip value
      );
      _unitKerja.assignAll(fetchUnitKerja);
    } catch (error) {
      print('Error fetching unit kerja : $error');
    }
  }
}