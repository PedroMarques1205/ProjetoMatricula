    package com.pucminas.backendprojmatricula.core.usuario;

    import com.pucminas.backendprojmatricula.common.enums.TipoUsuario;
    import com.pucminas.backendprojmatricula.dataprovider.alunosmatriculadosporcurso.IAlunosMatriculadosPorCursoRepository;
    import com.pucminas.backendprojmatricula.dataprovider.curso.ICursoRepository;
    import com.pucminas.backendprojmatricula.dataprovider.usuario.IUsuarioRepository;
    import com.pucminas.backendprojmatricula.entrypoint.usuario.dto.RequestEditarUsuarioDTO;
    import com.pucminas.backendprojmatricula.model.AlunosMatriculadosPorCurso;
    import com.pucminas.backendprojmatricula.model.Curso;
    import com.pucminas.backendprojmatricula.model.Usuario;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Service;

    import java.util.List;

    @Service
    public class UsuarioService {

        @Autowired
        IUsuarioRepository usuarioRepository;

        @Autowired
        IAlunosMatriculadosPorCursoRepository alunosMatriculadosPorCursoRepository;

        @Autowired
        ICursoRepository cursoRepository;

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

        public Usuario editarUsuario(RequestEditarUsuarioDTO params) {
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

        public Usuario login(String matricula, String Senha) {
            if(usuarioRepository.findById(matricula).isPresent()) {
                if(usuarioRepository.findById(matricula).get().getSenha().equals(Senha)) {
                    return usuarioRepository.findById(matricula).get();
                }
            }
            return null;
        }

        public List<Usuario> buscarUsuarioPorTipoAcesso(TipoUsuario acesso) {
            return usuarioRepository.findByTipoAcesso(acesso).stream()
                    .filter(Usuario::isAtivo)
                    .toList();
        }

        public AlunosMatriculadosPorCurso salvaNovoAlunoEmUmCurso(Usuario aluno,
                                                                  Long idCurso) {
            usuarioRepository.save(aluno);
            Curso curso = cursoRepository.findById(idCurso).isPresent() ? cursoRepository.findById(idCurso).get() : null;

            AlunosMatriculadosPorCurso alunosMatriculadosPorCurso = new AlunosMatriculadosPorCurso();
            alunosMatriculadosPorCurso.setCurso(curso);
            alunosMatriculadosPorCurso.setAluno(aluno);
            return alunosMatriculadosPorCursoRepository.save(alunosMatriculadosPorCurso);
        }
    }
