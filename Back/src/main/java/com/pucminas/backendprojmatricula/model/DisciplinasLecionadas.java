package com.pucminas.backendprojmatricula.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "Disciplinas_Lecionads")
public class DisciplinasLecionadas {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "professor_da_disciplina_matricula")
    Usuario professorDaDisciplina;

    @ManyToOne
    @JoinColumn(name = "disciplina_lecionada_id")
    Disciplina disciplinaLecionada;
}
