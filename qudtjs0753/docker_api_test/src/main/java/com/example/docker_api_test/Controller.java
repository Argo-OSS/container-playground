package com.example.docker_api_test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping("/api/v1/qudtjs0753")
    public String myName() {
        return "KBS";
    }

    @GetMapping("/healthcheck")
    public String healthCheck() {
        return "healthy";
    }
}
