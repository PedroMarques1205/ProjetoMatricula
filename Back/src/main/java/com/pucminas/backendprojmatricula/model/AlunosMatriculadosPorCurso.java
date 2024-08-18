package com.pucminas.backendprojmatricula.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "Alunos_Matriculados_Curso")
public class AlunosMatriculadosPorCurso {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "aluno_matricula")
    Usuario aluno;

    @ManyToOne
    @JoinColumn(name = "curso_id")
    Curso curso;
}
