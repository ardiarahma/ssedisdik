class DocCategoriesModel {
  final String id;
  final String name;
  final int no;
  final String addkop;
  final String koptype;

  DocCategoriesModel({
    required this.id,
    required this.name,
    required this.no,
    required this.addkop,
    required this.koptype,
  });

  factory DocCategoriesModel.fromJson(Map<String, dynamic> json) {
    return DocCategoriesModel(
      id: json['id'],
      name: json['name'],
      no: json['no'],
      addkop: json['addkop'],
      koptype: json['koptype'],
    );
  }
}
