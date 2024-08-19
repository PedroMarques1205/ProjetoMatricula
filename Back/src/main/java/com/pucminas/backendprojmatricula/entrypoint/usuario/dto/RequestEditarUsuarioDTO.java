package com.pucminas.backendprojmatricula.entrypoint.usuario.dto;

import com.pucminas.backendprojmatricula.common.enums.TipoUsuario;
import lombok.Data;

@Data
public class RequestEditarUsuarioDTO {
    String matricula;
    String nome;
    String senha;
    TipoUsuario tipoAcesso;
}
