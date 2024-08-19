package com.pucminas.backendprojmatricula.core.curso;

import com.pucminas.backendprojmatricula.dataprovider.curso.ICursoRepository;
import com.pucminas.backendprojmatricula.entrypoint.curso.dto.RequestEditarCursoDTO;
import com.pucminas.backendprojmatricula.model.Curso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CursoService {

    @Autowired
    ICursoRepository cursoRepository;

    public Optional<Curso> buscaCurso(Long id) {
        return cursoRepository.findById(id);
    }

    public List<Curso> buscaTodosCursos() {
        return cursoRepository.findAll().stream()
                .filter(Curso::isAtivo)
                .toList();
    }

    public Curso salvaCurso(Curso curso) {
        return cursoRepository.save(curso);
    }

    public Curso deletarCurso(Long id) {
        if(cursoRepository.findById(id).isPresent()) {
            Curso Curso = cursoRepository.findById(id).get();
            Curso.setAtivo(false);
            cursoRepository.save(Curso);

            return Curso;
        }
        return null;
    }

    public Curso editarCurso(RequestEditarCursoDTO params) {
        if(cursoRepository.findById(params.getId()).isPresent()) {
            Curso curso = cursoRepository.findById(params.getId()).get();

            if(params.getNome()!=null)
                curso.setNome(params.getNome());
            if(params.getDescricao()!=null)
                curso.setDescricao(params.getDescricao());

            cursoRepository.save(curso);

            return curso;
        }
        return null;
    }
}
