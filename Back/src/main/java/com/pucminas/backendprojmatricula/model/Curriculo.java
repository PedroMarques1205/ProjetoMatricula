package com.pucminas.backendprojmatricula.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "Curriculo")
public class Curriculo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumns({
            @JoinColumn(name = "ordinal"),
            @JoinColumn(name = "curso_id")
    })
    Semestre semestre;

    @ManyToOne
    @JoinColumn(name = "disciplina_id")
    Disciplina disciplina;

}
