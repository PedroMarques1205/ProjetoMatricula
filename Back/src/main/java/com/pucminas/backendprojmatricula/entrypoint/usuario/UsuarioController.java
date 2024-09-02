package com.pucminas.backendprojmatricula.entrypoint.usuario;
import com.pucminas.backendprojmatricula.common.enums.TipoUsuario;
import com.pucminas.backendprojmatricula.entrypoint.usuario.dto.RequestEditarUsuarioDTO;
import com.pucminas.backendprojmatricula.entrypoint.usuario.dto.UsuarioDTO;
import com.pucminas.backendprojmatricula.model.AlunosMatriculadosPorCurso;
import com.pucminas.backendprojmatricula.model.Usuario;
import com.pucminas.backendprojmatricula.usecase.usuario.DeletarUsuarioUseCase;
import com.pucminas.backendprojmatricula.usecase.usuario.EditarUsuarioUseCase;
import com.pucminas.backendprojmatricula.usecase.usuario.ObterUsuarioUseCase;
import com.pucminas.backendprojmatricula.usecase.usuario.SalvarNovoUsuarioUseCase;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/usuario")
public class UsuarioController {
    @Autowired
    SalvarNovoUsuarioUseCase salvarNovoUsuarioUseCase;

    @Autowired
    DeletarUsuarioUseCase deletarUsuarioUseCase;

    @Autowired
    EditarUsuarioUseCase editarUsuarioUseCase;

    @Autowired
    ObterUsuarioUseCase obterUsuarioUseCase;

    @PostMapping("/novoUsuario")
    public ResponseEntity<UsuarioDTO> salvaNovoUsuario(@RequestBody @Valid Usuario usuario) {
        return ResponseEntity.ok(salvarNovoUsuarioUseCase.salvarNovoUsuario(usuario));
    }

    @DeleteMapping("/deletarUsuario")
    public ResponseEntity<UsuarioDTO> deletarUsuario(@RequestBody String usuario) {
        return ResponseEntity.ok(deletarUsuarioUseCase.deletarUsuario(usuario));
    }

    @PutMapping("/editarUsuario")
    public ResponseEntity<UsuarioDTO> editarUsuario(@RequestBody RequestEditarUsuarioDTO params) {
        return ResponseEntity.ok(editarUsuarioUseCase.editarUsuario(params));
    }

    @GetMapping("/login")
    public ResponseEntity<Usuario> obterUsuario(@RequestParam String usuario, @RequestParam String senha) {
        return ResponseEntity.ok(obterUsuarioUseCase.obterUsuarioPorId(usuario, senha));
    }

    @GetMapping("/obterUsuariosPorTipoAcesso")
    public ResponseEntity<List<Usuario>> obterUsuarioPorAcesso(@RequestParam TipoUsuario usuario) {
        return ResponseEntity.ok(obterUsuarioUseCase.obterUsuarioPorTipoAcesso(usuario));
    }


    @GetMapping("/obterTurmaDeAlunosPorDisciplina")
    public ResponseEntity<List<Usuario>> obterUsuarioPorDisciplina(@RequestParam String nomeDisciplina) {
        return ResponseEntity.ok(obterUsuarioUseCase.obterUsuarioPorDisciplina(nomeDisciplina));
    }

    @PostMapping("/salvarNovoAlunoEmUmCurso")
    public ResponseEntity<AlunosMatriculadosPorCurso> matricular(@RequestBody Usuario aluno,@RequestParam Long idCurso) {
        return ResponseEntity.ok(salvarNovoUsuarioUseCase.salvaAlunoEmCurso(aluno,idCurso));
    }
}
