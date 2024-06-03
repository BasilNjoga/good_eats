import 'package:freezed_annotation/freezed_annotation.dart';

part 'food.freezed.dart';
part 'food.g.dart';

@freezed
class Food  with _$Food{
  const factory Food({
    required int id,
    required String title,
    required String image,
  }) = _Food;


  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
}