class PejabatModel {
  final String id;
  final String name;
  final int nik;
  final String noHP;
  final String email;
  final String photo;
  final String group;
  final String position;
  final String level;
  final String token;
  final String code;
  final String isOnline;
  final String banned;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;
  final String tte;
  final String spesimen;
  final int no;

  PejabatModel({
    required this.id,
    required this.name,
    required this.nik,
    required this.noHP,
    required this.email,
    required this.photo,
    required this.group,
    required this.position,
    required this.level,
    required this.token,
    required this.code,
    required this.isOnline,
    required this.banned,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
    required this.tte,
    required this.spesimen,
    required this.no,
  });

  factory PejabatModel.fromJson(Map<String, dynamic> json) {
    return PejabatModel(
      id: json['id'] as String,
      name: json['name'] as String,
      nik: json['nik'] as int,
      noHP: json['noHP'] as String,
      email: json['email'] as String,
      photo: json['photo'] as String,
      group: json['group'] as String,
      position: json['position'] as String,
      level: json['level'] as String,
      token: json['token'] as String,
      code: json['code'] as String,
      isOnline: json['isOnline'] as String,
      banned: json['banned'] as String,
      createdAt: json['createdAt'] as String,
      createdBy: json['createdBy'] as String,
      updatedAt: json['updatedAt'] as String,
      updatedBy: json['updatedBy'] as String,
      tte: json['tte'] as String,
      spesimen: json['spesimen'] as String,
      no: json['no'] as int,
    );
  }
}
