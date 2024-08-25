package com.pucminas.backendprojmatricula.core.disciplina;

import com.pucminas.backendprojmatricula.dataprovider.disciplina.IDisciplinaRepository;
import com.pucminas.backendprojmatricula.entrypoint.disciplina.dto.RequestEditarDisciplinaDTO;
import com.pucminas.backendprojmatricula.model.Disciplina;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DisciplinaService {

    @Autowired
    IDisciplinaRepository disciplinaRepository;

    public Disciplina salvarDisciplina(Disciplina disciplina) {
        // atualiza o status das disciplinas com base no número de alunos
       // if (disciplina.getNumeroAlunos() >= 3) {
         //   disciplina.setAtiva(true);
        //} else {
            //disciplina.setAtiva(false);
        //}
        return disciplinaRepository.save(disciplina);
    }

    public Disciplina deletarDisciplina(Long id) {
        if (disciplinaRepository.findById(id).isPresent()) {
            Disciplina disciplina = disciplinaRepository.findById(id).get();
            disciplinaRepository.save(disciplina);
            return disciplina;
        }
        return null;
    }

    public Disciplina editarDisciplina(RequestEditarDisciplinaDTO params) {
        if (disciplinaRepository.findById(params.getId()).isPresent()) {
            Disciplina disciplina = disciplinaRepository.findById(params.getId()).get();

            if (params.getNome() != null) {
                disciplina.setNome(params.getNome());
            }
            if (params.getDescricao() != null) {
                disciplina.setDescricao(params.getDescricao());
            }
            disciplina.setAtiva(params.isAtiva());

            return disciplinaRepository.save(disciplina);
        }
        return null;
    }

    public Disciplina obterDisciplina(Long id) {
        return disciplinaRepository.findById(id).orElse(null);
    }

    public List<Disciplina> obterTodasDisciplinas() {
        return disciplinaRepository.findAll();
    }
}
