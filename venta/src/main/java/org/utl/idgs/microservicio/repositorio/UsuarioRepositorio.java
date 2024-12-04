package org.utl.idgs.microservicio.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.utl.idgs.microservicio.entidad.Usuario;

public interface UsuarioRepositorio extends JpaRepository<Usuario, Long> {}