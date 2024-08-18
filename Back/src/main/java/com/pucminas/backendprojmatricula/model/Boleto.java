package com.pucminas.backendprojmatricula.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity(name = "Boletos")
public class Boleto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "aluno_devedor_matricula")
    Usuario alunoDevedor;

    @NotNull
    LocalDateTime dataValidade;

    @NotNull
    boolean pago = false;
}
