import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/src/features/authentication/models/pejabat_model.dart';
import 'package:ssedisdik/src/features/authentication/models/unit_kerja_model.dart';

class PejabatController extends GetxController {
  final List<PejabatModel> _pejabat = [
    PejabatModel(
      pejabatId: 1,
      pejabat: "Purwosusilo, M.Pd",
    ),
    PejabatModel(
      pejabatId: 2,
      pejabat: "Agus Ramdani",
    ),

    // Tambahkan kategori lainnya di sini
  ];

  List<PejabatModel> get pejabats => _pejabat;
}
