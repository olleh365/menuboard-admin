import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  final String? nickname;
  final String? profileImageUrl;
  final String grantType;
  final String accessToken;
  final int memberSeq;
  final String authority;
  final bool additionalInfo;
  final String memberUid;

  AuthResponse({
    this.nickname,
    this.profileImageUrl,
    required this.grantType,
    required this.accessToken,
    required this.memberSeq,
    required this.authority,
    required this.additionalInfo,
    required this.memberUid,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
