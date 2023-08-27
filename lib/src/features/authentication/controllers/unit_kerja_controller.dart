import 'package:get/get.dart';
import 'package:ssedisdik/src/features/authentication/models/unit_kerja_model.dart';

class UnitKerjaController extends GetxController{
  final List<UnitKerjaModel> _unitKerja = [
    UnitKerjaModel(
      unitKerjaId: 1,
      unitKerja: "Bidang PAUD",
    ),
    UnitKerjaModel(
      unitKerjaId: 2,
      unitKerja: "Bidang SD & PKLK",
    ),
    UnitKerjaModel(
      unitKerjaId: 3,
      unitKerja: "Bidang SMP",
    ),
    UnitKerjaModel(
      unitKerjaId: 4,
      unitKerja: "Bidang SMA",
    ),
    UnitKerjaModel(
      unitKerjaId: 5,
      unitKerja: "Bidang SMK",
    ),
    UnitKerjaModel(
      unitKerjaId: 6,
      unitKerja: "Sekretariat",
    ),
    UnitKerjaModel(
      unitKerjaId: 7,
      unitKerja: "Bidang PTK",
    ),
    UnitKerjaModel(
      unitKerjaId: 8,
      unitKerja: "Bidang P & A",
    ),
    UnitKerjaModel(
      unitKerjaId: 9,
      unitKerja: "UP Prasardik",
    ),UnitKerjaModel(
      unitKerjaId: 10,
      unitKerja: "Pusdatindik",
    ),
    UnitKerjaModel(
      unitKerjaId: 11,
      unitKerja: "P4",
    ),
    UnitKerjaModel(
      unitKerjaId: 12,
      unitKerja: "Suku Dinas Pendidikan Wilayah I Kota Adm. Jakarta Pusat",
    ),
    // Tambahkan kategori lainnya di sini
  ];

  List<UnitKerjaModel> get unitsKerja => _unitKerja;
}