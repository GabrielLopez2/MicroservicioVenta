package org.utl.idgs.microservicio.dto;

import lombok.Builder;
import lombok.Data;
import org.utl.idgs.microservicio.entidad.Persona;
import org.utl.idgs.microservicio.entidad.Rol;

@Data
@Builder
public class UsuarioDto {
    private Long id;
    private String correo;
    private String username;
    private String password;
    private Rol rol;
    private Persona persona;
    private Boolean activo;
}

