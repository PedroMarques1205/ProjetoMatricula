package com.pucminas.backendprojmatricula.usecase.disciplina;

import com.pucminas.backendprojmatricula.core.disciplina.DisciplinaService;
import com.pucminas.backendprojmatricula.entrypoint.disciplina.dto.RequestEditarDisciplinaDTO;
import com.pucminas.backendprojmatricula.model.Disciplina;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class EditarDisciplinaUseCase {

    @Autowired
    DisciplinaService disciplinaService;

    public Disciplina editarDisciplina(RequestEditarDisciplinaDTO dto) {
        Disciplina disciplina = disciplinaService.obterDisciplina(dto.getId());
        disciplina.setNome(dto.getNome());
        disciplina.setDescricao(dto.getDescricao());
        disciplina.setAtiva(dto.isAtiva());
        return disciplinaService.salvarDisciplina(disciplina);
    }
}
