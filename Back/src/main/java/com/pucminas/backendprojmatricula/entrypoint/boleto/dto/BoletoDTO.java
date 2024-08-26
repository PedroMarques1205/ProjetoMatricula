package com.pucminas.backendprojmatricula.entrypoint.boleto.dto;

import com.pucminas.backendprojmatricula.model.Usuario;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
public class BoletoDTO {
    Usuario alunoDevedor;
    LocalDateTime dataValidade;
    Double valor;
    boolean pago = false;
}
