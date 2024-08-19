package com.pucminas.backendprojmatricula.model;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;

@Data
@Entity(name = "Semestres")
public class Semestre {

    @EmbeddedId
    private SemestreId id;

    class SemestreId implements Serializable {
        private Integer ordinal;

        @ManyToOne
        @JoinColumn(name = "curso_id")
        private Curso curso;
    }
}
