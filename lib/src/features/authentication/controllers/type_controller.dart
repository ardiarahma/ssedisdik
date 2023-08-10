import 'package:get/get.dart';
import 'package:ssedisdik/src/features/authentication/models/type_model.dart';

class TypeController extends GetxController {
  final List<TypeModel> _type = [
    TypeModel(
      typeId: 1,
      type: "Paraf",
    ),
    TypeModel(
      typeId: 2,
      type: "TTD",
    ),

  ];

  List<TypeModel> get types => _type;
}
