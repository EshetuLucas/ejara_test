import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  UserModel._();
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory UserModel({
    /// User token
    required String token,

    /// Created at date and time for this user
    DateTime? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
