package com.pucminas.backendprojmatricula.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "Matriculas")
public class Matricula {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "aluno_matricula")
    Usuario aluno;

    @ManyToOne
    @JoinColumn(name = "disciplina_id")
    Disciplina disciplina;
}
