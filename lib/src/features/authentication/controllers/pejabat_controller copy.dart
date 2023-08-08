import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssedisdik/src/features/authentication/models/pejabat_model.dart';
import 'package:ssedisdik/src/features/authentication/models/position_model.dart';
import 'package:ssedisdik/src/features/authentication/models/unit_kerja_model.dart';

class PositionController extends GetxController {
  final List<PositionModel> _position = [
    PositionModel(
      positionId: 1,
      position: "Potrait",
    ),
    PositionModel(
      positionId: 2,
      position: "Landscape",
    ),

    // Tambahkan kategori lainnya di sini
  ];

  List<PositionModel> get positions => _position;
}
