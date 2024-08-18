package com.pucminas.backendprojmatricula.usecase.usuario;

import com.pucminas.backendprojmatricula.common.enums.TipoUsuario;
import com.pucminas.backendprojmatricula.common.mapper.Mapper;
import com.pucminas.backendprojmatricula.core.usuario.UsuarioService;
import com.pucminas.backendprojmatricula.entrypoint.usuario.dto.RequestEditarDTO;
import com.pucminas.backendprojmatricula.entrypoint.usuario.dto.UsuarioDTO;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class EditarUsuarioUseCase {

    @Autowired
    UsuarioService usuarioService;

    @Autowired
    Mapper mapper;

    public UsuarioDTO editarUsuario(RequestEditarDTO params) {
        Usuario usuarioSalvo = usuarioService.editarUsuario(params);
        return mapper.generalMapper(usuarioSalvo,UsuarioDTO.class);
    }
}
