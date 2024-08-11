package com.pucminas.backendprojmatricula.dataprovider;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    @GetMapping("/Poggers")
    public String getUser() {
        return "Hello World";
    }
}
