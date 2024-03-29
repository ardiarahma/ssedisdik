import 'group_model.dart';
import 'level_model.dart';
import 'position_model.dart';

class User {
  final String id;
  final String name;
  final int nik;
  final String noHP;
  final String email;
  final String photo;
  final Group group;
  final Position position;
  final Level level;
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

  User({
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nik ': nik,
      'noHp': noHP,
      'email': email,
      'photo': photo,
      'group': group.toJson(),
      'position': position.toJson(),
      'level': level.toJson(),
      'token': token,
      'code': code,
      'isOnline': isOnline,
      'banned': banned,
      'createdAt': createdAt,
      'createdBy': createdBy,
      'updatedAt': updatedAt,
      'updatedBy': updatedBy,
      'tte': tte,
      'spesimen': spesimen,
      'no': no,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      nik: json['nik'],
      noHP: json['noHP'],
      email: json['email'],
      photo: json['photo'],
      group: Group.fromJson(json['group']),
      position: Position.fromJson(json['position']),
      level: Level.fromJson(json['level']),
      token: json['token'],
      code: json['code'],
      isOnline: json['isOnline'],
      banned: json['banned'],
      createdAt: json['createdAt'],
      createdBy: json['createdBy'],
      updatedAt: json['updatedAt'],
      updatedBy: json['updatedBy'],
      tte: json['tte'],
      spesimen: json['spesimen'],
      no: json['no'],
    );
  }
}
