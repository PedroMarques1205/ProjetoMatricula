package com.pucminas.backendprojmatricula.model;

import com.pucminas.backendprojmatricula.common.enums.TipoUsuario;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

@Data
@Entity
public class Usuario {
    @Id
    @NotEmpty
    private String Matricula;

    @NotEmpty
    private String nome;

    @NotEmpty
    private String senha;

    @NotEmpty
    TipoUsuario tipo;
}
