package com.sample.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;

import java.util.Arrays;

@RestController
public class HelloWorld {

  @GetMapping(value = "hello")
  public Flux<String> hello() {
    return Flux.fromStream(Arrays.asList("hey ", "hello").stream());
  }
}
