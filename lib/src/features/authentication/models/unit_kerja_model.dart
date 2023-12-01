class UnitKerjaModel {
  final String id;
  final String name;
  final int no;

  UnitKerjaModel({
    required this.id,
    required this.name,
    required this.no,
  });

  factory UnitKerjaModel.fromJson(Map<String, dynamic> json) {
    return UnitKerjaModel(
      id: json['id'],
      name: json['name'],
      no: json['no'],
    );
  }
}
