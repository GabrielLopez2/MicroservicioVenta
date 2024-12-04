package org.utl.idgs.microservicio.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.utl.idgs.microservicio.entidad.Persona;

import java.util.Optional;

public interface PersonaRepositorio extends JpaRepository<Persona, Long> {
    Optional<Persona> findByTelefono(String telefono);
}
