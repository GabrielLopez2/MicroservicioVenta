package org.utl.idgs.microservicio.dto;

import lombok.Builder;
import lombok.Data;
import org.utl.idgs.microservicio.entidad.Usuario;

import java.time.Instant;

@Data
@Builder
public class VentaDto {
    private Long id;
    private Instant fecha;
    private Usuario empleado;
    private Usuario cliente;
}
