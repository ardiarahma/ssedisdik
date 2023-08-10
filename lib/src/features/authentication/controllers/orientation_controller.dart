import 'package:get/get.dart';
import 'package:ssedisdik/src/features/authentication/models/orientation_model.dart';

class OrientationController extends GetxController {
  final List<OrientationModel> _orientation = [
    OrientationModel(
      orientationId: 1,
      orientation: "Potrait",
    ),
    OrientationModel(
      orientationId: 2,
      orientation: "Landscape",
    ),

  ];

  List<OrientationModel> get orientations => _orientation;
}
