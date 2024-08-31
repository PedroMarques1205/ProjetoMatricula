import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

class UserModel extends UserDTO {
  List<SubjectDTO>? optionalSubjects;
  List<SubjectDTO>? obligatorySubjects;
  List<SubjectDTO>? allSubjects;

  UserModel({
    super.nome,
    super.senha,
    super.tipoAcesso,
    super.ativo,
    super.matricula,
    this.optionalSubjects,
    this.obligatorySubjects,
    this.allSubjects,
  });

  void bind(UserDTO dto) {
    nome = dto.nome;
    senha = dto.senha;
    tipoAcesso = dto.tipoAcesso;
    ativo = dto.ativo;
    matricula = dto.matricula;
  }
}
