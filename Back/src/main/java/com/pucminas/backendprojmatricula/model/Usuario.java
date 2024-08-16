package com.pucminas.backendprojmatricula.model;

import com.pucminas.backendprojmatricula.common.enums.TipoUsuario;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
// Data ja crianddo get set e construtores 
@Data
// olha a classe usuario e cria tabela usuario no banco direto 
@Entity
public class Usuario {
    // colocou o id por aqui primery key
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
