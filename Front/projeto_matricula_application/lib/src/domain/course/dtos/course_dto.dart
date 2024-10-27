import 'package:json_annotation/json_annotation.dart';

part 'course_dto.g.dart';

@JsonSerializable()
class CourseDTO {
  int? id;
  String? nome;
  String? descricao;
  bool? ativo;
  int? numSemestres;

  CourseDTO({this.id, this.nome, this.descricao, this.numSemestres, this.ativo = true});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'numSemestres': numSemestres,
      'ativo': ativo,
    };
  }

  static CourseDTO fromJson(Map<String, dynamic> json) {
    return CourseDTO(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      numSemestres: json['numSemestres'],
      ativo: json['ativo'],
    );
  }
}
