import 'package:json_annotation/json_annotation.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

part 'boleto_dto.g.dart'; 

@JsonSerializable()
class BoletoDTO {
  int? id;
  UserDTO? alunoDevedor;
  DateTime? dataValidade;
  double? valor;
  bool? pago;

  BoletoDTO({
    this.id,
    this.alunoDevedor,
    this.dataValidade,
    this.valor,
    this.pago,
  });

  factory BoletoDTO.fromJson(Map<String, dynamic> json) => _$BoletoDTOFromJson(json);
  Map<String, dynamic> toJson() => _$BoletoDTOToJson(this);
}
