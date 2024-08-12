// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      nickname: json['nickname'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      grantType: json['grantType'] as String,
      accessToken: json['accessToken'] as String,
      memberSeq: (json['memberSeq'] as num).toInt(),
      authority: json['authority'] as String,
      additionalInfo: json['additionalInfo'] as bool,
      memberUid: json['memberUid'] as String,
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'profileImageUrl': instance.profileImageUrl,
      'grantType': instance.grantType,
      'accessToken': instance.accessToken,
      'memberSeq': instance.memberSeq,
      'authority': instance.authority,
      'additionalInfo': instance.additionalInfo,
      'memberUid': instance.memberUid,
    };
