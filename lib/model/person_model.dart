/*
import 'package:freezed_annotation/freezed_annotation.dart';
part 'person_model.freezed.dart';
part 'person_model.g.dart';
@Freezed()
class PersonModel with _$PersonModel{
  @JsonSerializable(fieldRename: FieldRename.kebab)
  factory PersonModel({
    @Default('')String name,
    @Default(0) int age,
    @Default([])@JsonKey(name: 'tv_show')List<String> tvShow
})  = _PersonModel;

  factory PersonModel.fromJson(Map<String, dynamic> json) => _$PersonModelFromJson(json);

}*/
