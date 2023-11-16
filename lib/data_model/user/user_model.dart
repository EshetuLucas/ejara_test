import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  UserModel._();
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory UserModel({
    /// User id [required]
    required String id,

    /// User email [optional]
    String? email,

    /// User phone [optional]
    String? phone,

    /// User profile pic if any
    String? profilePicUrl,

    /// Created at date and time for this user
    DateTime? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
