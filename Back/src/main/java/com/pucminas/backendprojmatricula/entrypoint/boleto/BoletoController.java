package com.pucminas.backendprojmatricula.entrypoint.boleto;

import com.pucminas.backendprojmatricula.common.mapper.Mapper;
import com.pucminas.backendprojmatricula.entrypoint.boleto.dto.BoletoDTO;
import com.pucminas.backendprojmatricula.model.Boleto;
import com.pucminas.backendprojmatricula.model.Usuario;
import com.pucminas.backendprojmatricula.usecase.boleto.GerarBoletoUseCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/Boleto")
public class BoletoController {

    @Autowired
    GerarBoletoUseCase gerarBoletoUseCase;

    @Autowired
    Mapper mapper;

    @PostMapping("/gerarBoleto")
    public ResponseEntity<String> gerarBoleto(@RequestParam String matriculaAluno, @RequestParam Double valor) {
        gerarBoletoUseCase.gerarBoleto(matriculaAluno, valor);

        return ResponseEntity.ok("Boleto gerado com sucesso! para o aluno: " + matriculaAluno);
    }
}
