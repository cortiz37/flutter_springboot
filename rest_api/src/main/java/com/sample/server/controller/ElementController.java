package com.sample.server.controller;

import com.sample.server.model.Element;
import com.sample.server.service.ElementService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.Optional;

@Controller
@RequestMapping("/elements")
public class ElementController {

    private static final String LABEL = "Access";

    private final ElementService elementService;

    @Autowired
    public ElementController(ElementService elementService) {
        this.elementService = elementService;
    }

    @ApiOperation(value = "Get all", tags = LABEL)
    @GetMapping("/")
    public ResponseEntity getAll() {
        return ResponseEntity.ok(elementService.getAll());
    }

    @ApiOperation(value = "Get by id", tags = LABEL)
    @GetMapping("/{id}/")
    public ResponseEntity getById(@PathVariable(name = "id") String id) {
        final Optional<Element> element = elementService.getById(id);
        return element.isPresent() ? ResponseEntity.ok(element.get()) : ResponseEntity.notFound().build();
    }

    @ApiOperation(value = "Execute action", tags = LABEL)
    @PostMapping("/")
    public ResponseEntity create(@RequestBody Element element) {
        Element saved = elementService.create(element);
        return ResponseEntity.created(URI.create("/${saved.id}")).build();
    }
}