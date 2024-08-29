package com.pucminas.backendprojmatricula.usecase.usuario;

import com.pucminas.backendprojmatricula.common.enums.TipoUsuario;
import com.pucminas.backendprojmatricula.common.mapper.Mapper;
import com.pucminas.backendprojmatricula.core.matricula.MatriculaService;
import com.pucminas.backendprojmatricula.core.usuario.UsuarioService;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ObterUsuarioUseCase {

    @Autowired
    UsuarioService usuarioService;

    @Autowired
    MatriculaService matriculaService;

    @Autowired
    Mapper mapper;

    public Usuario obterUsuarioPorId(String matricula, String senha) {
        return usuarioService.login(matricula, senha);
    }

    public List<Usuario> obterUsuarioPorTipoAcesso(TipoUsuario acesso) {
        return usuarioService.buscarUsuarioPorTipoAcesso(acesso);
    }

    public List<Usuario> obterUsuarioPorDisciplina(String disciplina) {
        return matriculaService.obterAlunosPorDisciplina(disciplina);
    }
}
