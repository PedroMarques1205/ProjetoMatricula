package com.pucminas.backendprojmatricula.core.usuario;

import com.pucminas.backendprojmatricula.common.enums.TipoUsuario;
import com.pucminas.backendprojmatricula.dataprovider.usuario.IUsuarioRepository;
import com.pucminas.backendprojmatricula.entrypoint.usuario.dto.RequestEditarDTO;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {

    @Autowired
    IUsuarioRepository usuarioRepository;

    public Usuario salvarUsuario(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    public Usuario deletarUsuario(String matricula) {
        if(usuarioRepository.findById(matricula).isPresent()) {
            Usuario usuario = usuarioRepository.findById(matricula).get();
            usuario.setAtivo(false);
            usuarioRepository.save(usuario);

            return usuario;
        }
        return null;
    }

    public Usuario editarUsuario(RequestEditarDTO params) {
        if(usuarioRepository.findById(params.getMatricula()).isPresent()) {
            Usuario usuario = usuarioRepository.findById(params.getMatricula()).get();

            if(params.getNome()!=null)
                usuario.setNome(params.getNome());
            if(params.getSenha()!=null)
                usuario.setSenha(params.getSenha());
            if(params.getTipoAcesso()!=null)
                usuario.setTipoAcesso(params.getTipoAcesso());


            usuarioRepository.save(usuario);

            return usuario;
        }
        return null;
    }

    public Usuario buscarUsuarioPorMatricula(String matricula) {
        if(usuarioRepository.findById(matricula).isPresent()) {
            return usuarioRepository.findById(matricula).get();
        }
        return null;
    }
}
