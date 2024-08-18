package com.pucminas.backendprojmatricula.entrypoint.usuario;
import com.pucminas.backendprojmatricula.common.enums.TipoUsuario;
import com.pucminas.backendprojmatricula.entrypoint.usuario.dto.RequestEditarDTO;
import com.pucminas.backendprojmatricula.entrypoint.usuario.dto.UsuarioDTO;
import com.pucminas.backendprojmatricula.model.Usuario;
import com.pucminas.backendprojmatricula.usecase.usuario.DeletarUsuarioUseCase;
import com.pucminas.backendprojmatricula.usecase.usuario.EditarUsuarioUseCase;
import com.pucminas.backendprojmatricula.usecase.usuario.ObterUsuarioUseCase;
import com.pucminas.backendprojmatricula.usecase.usuario.SalvarNovoUsuarioUseCase;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
    public ResponseEntity<UsuarioDTO> editarUsuario(@RequestBody RequestEditarDTO params) {
        return ResponseEntity.ok(editarUsuarioUseCase.editarUsuario(params));
    }

    @GetMapping("/obterUsuarioPorMatricula")
    public ResponseEntity<Usuario> obterUsuario(@RequestParam String usuario) {
        return ResponseEntity.ok(obterUsuarioUseCase.obterUsuarioPorId(usuario));
    }
}
