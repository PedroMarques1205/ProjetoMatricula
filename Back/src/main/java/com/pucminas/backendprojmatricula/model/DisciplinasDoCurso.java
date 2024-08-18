package com.pucminas.backendprojmatricula.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "Disciplinas_Curso")
public class DisciplinasDoCurso {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "disciplina_id")
    Disciplina disciplina;

    @ManyToOne
    @JoinColumn(name = "curso_id")
    Curso curso;
}
