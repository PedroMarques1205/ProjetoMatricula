import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CourseSubjectsDTO {
  int? id;
  String? cursoId;
  String? disciplinaId;
  String? semestreId;

  CourseSubjectsDTO({
    this.id,
    this.cursoId,
    this.disciplinaId,
    this.semestreId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cursoId': cursoId,
      'disciplinaId': disciplinaId,
      'semestreId': semestreId,
    };
  }

  static CourseSubjectsDTO fromJson(Map<String, dynamic> json) {
    return CourseSubjectsDTO(
      id: json['id'],
      cursoId: json['cursoId'],
      disciplinaId: json['disciplinaId'],
      semestreId: json['semestreId'],
    );
  }
}
