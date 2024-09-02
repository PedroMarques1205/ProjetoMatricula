package com.pucminas.backendprojmatricula.usecase.usuario;

import com.pucminas.backendprojmatricula.common.mapper.Mapper;
import com.pucminas.backendprojmatricula.core.alunosmatriculadosporcurso.AlunosMatriculadosPorCursoService;
import com.pucminas.backendprojmatricula.core.usuario.UsuarioService;
import com.pucminas.backendprojmatricula.entrypoint.usuario.dto.UsuarioDTO;
import com.pucminas.backendprojmatricula.model.AlunosMatriculadosPorCurso;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SalvarNovoUsuarioUseCase {

    @Autowired
    UsuarioService usuarioService;

    @Autowired
    Mapper mapper;

    public UsuarioDTO salvarNovoUsuario(Usuario usuario) {
        Usuario usuarioSalvo = usuarioService.salvarUsuario(usuario);
        return mapper.generalMapper(usuarioSalvo,
                UsuarioDTO.class);
    }

    public AlunosMatriculadosPorCurso salvaAlunoEmCurso(Usuario aluno, Long idCurso) {
        return usuarioService.salvaNovoAlunoEmUmCurso(aluno,idCurso);
    }


}
