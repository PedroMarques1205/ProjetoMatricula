package com.pucminas.backendprojmatricula.entrypoint.usuario.dto;

import com.pucminas.backendprojmatricula.common.enums.TipoUsuario;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
public class UsuarioDTO {
    private String matricula;
    private String nome;
    private boolean ativo;
    private TipoUsuario tipoUsuario;
}
