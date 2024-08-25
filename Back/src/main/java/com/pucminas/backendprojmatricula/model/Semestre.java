package com.pucminas.backendprojmatricula.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@Entity(name = "Semestres")
public class Semestre {

    @EmbeddedId
    private SemestreId id;

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    @Builder
    @Embeddable
    public static class SemestreId implements Serializable {
        private Integer ordinal;

        @ManyToOne
        @JoinColumn(name = "curso_id")
        private Curso curso;
    }
}
