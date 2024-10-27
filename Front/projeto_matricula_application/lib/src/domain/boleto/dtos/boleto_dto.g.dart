// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boleto_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoletoDTO _$BoletoDTOFromJson(Map<String, dynamic> json) => BoletoDTO(
      id: json['id'] as int?,
      alunoDevedor: json['alunoDevedor'] == null
          ? null
          : UserDTO.fromJson(json['alunoDevedor'] as Map<String, dynamic>),
      dataValidade: json['dataValidade'] == null
          ? null
          : DateTime.parse(json['dataValidade'] as String),
      valor: (json['valor'] as num?)?.toDouble(),
      pago: json['pago'] as bool?,
    );

Map<String, dynamic> _$BoletoDTOToJson(BoletoDTO instance) => <String, dynamic>{
      'id': instance.id,
      'alunoDevedor': instance.alunoDevedor,
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'valor': instance.valor,
      'pago': instance.pago,
    };
