import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SemesterDTO {
  String? id;
  int? ordinal;
  String? courseId;

  SemesterDTO({
    this.id,
    this.ordinal,
    this.courseId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ordinal': ordinal,
      'courseId': courseId,
    };
  }

  static SemesterDTO fromJson(Map<String, dynamic> json) {
    return SemesterDTO(
      id: json['id'],
      ordinal: json['ordinal'],
      courseId: json['courseId'],
    );
  }
}
