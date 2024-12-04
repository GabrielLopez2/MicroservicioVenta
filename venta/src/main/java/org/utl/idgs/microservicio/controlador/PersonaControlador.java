package org.utl.idgs.microservicio.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.utl.idgs.microservicio.entidad.Persona;
import org.utl.idgs.microservicio.repositorio.PersonaRepositorio;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/persona")
public class PersonaControlador {

    @Autowired
    private PersonaRepositorio personaRepositorio;

    // Crear una nueva Persona
    @PostMapping
    public ResponseEntity<Persona> crear(@RequestBody Persona persona) {
        try {
            // Guardar la persona en la base de datos
            Persona nuevaPersona = personaRepositorio.save(persona);
            return new ResponseEntity<>(nuevaPersona, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Listar todas las Personas
    @GetMapping
    public ResponseEntity<List<Persona>> listar() {
        try {
            List<Persona> personas = personaRepositorio.findAll();
            if (personas.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(personas, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Obtener una Persona por ID
    @GetMapping("/{id}")
    public ResponseEntity<Persona> obtener(@PathVariable("id") Long id) {
        Optional<Persona> persona = personaRepositorio.findById(id);
        if (persona.isPresent()) {
            return new ResponseEntity<>(persona.get(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Modificar una Persona existente
    @PutMapping("/{id}")
    public ResponseEntity<Persona> modificar(@PathVariable("id") Long id, @RequestBody Persona personaDetalles) {
        Optional<Persona> personaExistente = personaRepositorio.findById(id);

        if (personaExistente.isPresent()) {
            Persona persona = personaExistente.get();
            persona.setNombres(personaDetalles.getNombres());
            persona.setApellidos(personaDetalles.getApellidos());
            persona.setTelefono(personaDetalles.getTelefono());
            persona.setFechaNacimiento(personaDetalles.getFechaNacimiento());
            return new ResponseEntity<>(personaRepositorio.save(persona), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Eliminar una Persona por ID
    @DeleteMapping("/{id}")
    public ResponseEntity<HttpStatus> eliminar(@PathVariable("id") Long id) {
        try {
            personaRepositorio.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
