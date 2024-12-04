package org.utl.idgs.microservicio.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;
import org.utl.idgs.microservicio.entidad.Asiento;
import org.utl.idgs.microservicio.entidad.Funcion;
import org.utl.idgs.microservicio.entidad.Producto;
import org.utl.idgs.microservicio.entidad.Venta;

import java.util.Collection;
import java.util.List;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class DetalleVentaDto {

    private Long id;
    private Venta venta;
    private Producto producto;
    private Funcion funcion;
    private Collection<Asiento> asientos;
    private int cantidad;
    private float subtotalDetalle;

}
