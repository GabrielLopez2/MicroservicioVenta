package org.utl.idgs.microservicio.dto;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ProveedorDto {
    private Long id;
    private String nombreProveedor;
    private String correo;
    private String telefono;
}
