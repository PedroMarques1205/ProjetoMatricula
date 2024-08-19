package com.pucminas.backendprojmatricula.entrypoint.usuario.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
public class UsuarioDTO {
    private String matricula;
    private String nome;
    private boolean ativo;
}
