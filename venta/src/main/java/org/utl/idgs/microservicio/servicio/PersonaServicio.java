package org.utl.idgs.microservicio.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.utl.idgs.microservicio.entidad.Persona;
import org.utl.idgs.microservicio.repositorio.PersonaRepositorio;

import java.util.Optional;

@Service
public class PersonaServicio {

    @Autowired
    private PersonaRepositorio personaRepositorio;

    public Persona buscarOCrear(Persona persona) {
        // Busca si ya existe una persona con el mismo teléfono (asumiendo que es único).
        Optional<Persona> personaExistente = personaRepositorio.findByTelefono(persona.getTelefono());
        // Si no existe, la crea y la guarda.
        return personaExistente.orElseGet(() -> personaRepositorio.save(persona));
    }
}
