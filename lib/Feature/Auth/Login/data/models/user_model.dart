import 'package:equatable/equatable.dart';
import 'profile_model.dart';

class User with EquatableMixin {
  int? id;
  String? name;
  String? email;
  Null emailVerifiedAt;
  String? phone;
  Null phoneVerifiedAt;
  String? type;
  Profile? profile;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.phoneVerifiedAt,
    this.type,
    this.profile,
  });

  @override
  List<Object?> get props =>
      [id, name, email, emailVerifiedAt, phone, phoneVerifiedAt, type, profile];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] as Null,
      phone: json['phone'] as String?,
      phoneVerifiedAt: json['phone_verified_at'] as Null,
      type: json['type'] as String?,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );
  }
}
