package com.example.my_web_service;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping("/healthcheck")
    public String healthcheck() {
        return "OK";
    }

    @GetMapping("/api/v1/thisishwan2")
    public String thisishwan2() {
        return "Hi i'm hwan";
    }
}
