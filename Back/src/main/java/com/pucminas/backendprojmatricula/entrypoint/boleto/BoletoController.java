package com.pucminas.backendprojmatricula.entrypoint.boleto;

import com.pucminas.backendprojmatricula.common.mapper.Mapper;
import com.pucminas.backendprojmatricula.model.Boleto;
import com.pucminas.backendprojmatricula.usecase.boleto.GerarBoletoUseCase;
import com.pucminas.backendprojmatricula.usecase.boleto.ObterBoletoUseCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/Boleto")
public class BoletoController {

    @Autowired
    GerarBoletoUseCase gerarBoletoUseCase;

    @Autowired
    ObterBoletoUseCase obterBoletoUseCase;

    @Autowired
    Mapper mapper;

    @PostMapping("/gerarBoleto")
    public ResponseEntity<Boleto> gerarBoleto(@RequestParam String matriculaAluno, @RequestParam Double valor) {
        return ResponseEntity.ok(gerarBoletoUseCase.gerarBoleto(matriculaAluno, valor));
    }

    @GetMapping("/obterBoletoPorAluno")
    public ResponseEntity<List<Boleto>> obterBoletoPorAluno(@RequestParam String matriculaAluno) {
        return ResponseEntity.ok(obterBoletoUseCase.obterBoletosPorAluno(matriculaAluno));
    }
}
