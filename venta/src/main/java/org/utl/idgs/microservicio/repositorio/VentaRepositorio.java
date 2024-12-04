package org.utl.idgs.microservicio.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.utl.idgs.microservicio.entidad.*;

@Repository
public interface VentaRepositorio extends JpaRepository<Venta, Long> {

}