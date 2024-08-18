package com.pucminas.backendprojmatricula.usecase.usuario;

import com.pucminas.backendprojmatricula.common.mapper.Mapper;
import com.pucminas.backendprojmatricula.core.usuario.UsuarioService;
import com.pucminas.backendprojmatricula.entrypoint.usuario.dto.UsuarioDTO;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ObterUsuarioUseCase {

    @Autowired
    UsuarioService usuarioService;

    @Autowired
    Mapper mapper;

    public Usuario obterUsuarioPorId(String matricula) {
        return usuarioService.buscarUsuarioPorMatricula(matricula);
    }
}
