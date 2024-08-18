package com.pucminas.backendprojmatricula.usecase.usuario;

import com.pucminas.backendprojmatricula.core.usuario.UsuarioService;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DeletarUsuarioUseCase {
    @Autowired
    UsuarioService usuarioService;

    public Usuario deletarUsuario(Usuario usuario) {
        return usuarioService.deletarUsuario(usuario);
    }

}
