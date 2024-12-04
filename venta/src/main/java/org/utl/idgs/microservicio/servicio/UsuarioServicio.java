package org.utl.idgs.microservicio.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.utl.idgs.microservicio.dto.UsuarioDto;
import org.utl.idgs.microservicio.entidad.Persona;
import org.utl.idgs.microservicio.entidad.Usuario;
import org.utl.idgs.microservicio.repositorio.PersonaRepositorio;
import org.utl.idgs.microservicio.repositorio.UsuarioRepositorio;

import java.util.List;
import java.util.Optional;

@Service
public class UsuarioServicio {

    @Autowired
    private UsuarioRepositorio usuarioRepositorio;

    @Autowired
    private PersonaRepositorio personaRepositorio;

    public UsuarioDto crear(UsuarioDto usuarioDto) {
        try {
            // Verificar si la Persona ya existe por algún criterio único (por ejemplo, teléfono).
            Optional<Persona> personaExistente = personaRepositorio.findByTelefono(usuarioDto.getPersona().getTelefono());

            // Si existe, usar la existente; de lo contrario, crear una nueva.
            Persona persona = personaExistente.orElseGet(() ->
                    personaRepositorio.save(usuarioDto.getPersona())
            );

            // Construir y guardar el Usuario con la Persona asociada.
            Usuario usuario = usuarioRepositorio.save(Usuario.builder()
                    .id(usuarioDto.getId())
                    .correo(usuarioDto.getCorreo())
                    .username(usuarioDto.getUsername())
                    .password(usuarioDto.getPassword())
                    .rol(usuarioDto.getRol())
                    .persona(persona) // Usar la Persona asociada (existente o nueva).
                    .activo(usuarioDto.getActivo())
                    .build());

            // Convertir a DTO y retornar.
            return construirDto(usuario);

        } catch (Exception e) {
            throw new RuntimeException("Error al crear el usuario: " + e.getMessage(), e);
        }
    }

    public List<Usuario> listar() {
        return usuarioRepositorio.findAll();
    }

    public Usuario obtener(Long id) {
        Optional<Usuario> usuario = usuarioRepositorio.findById(id);
        return usuario.orElse(null);
    }

    public UsuarioDto modificar(Usuario usuario) {
        try {
            obtener(usuario.getId());

            return construirDto(usuarioRepositorio.save(usuario));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private UsuarioDto construirDto(Usuario usuario) {
        Optional<Usuario> usuarioOptional = usuarioRepositorio.findById(usuario.getId());

        if (usuarioOptional.isPresent()) {
            return UsuarioDto.builder()
                    .id(usuario.getId())
                    .correo(usuario.getCorreo())
                    .username(usuario.getUsername())
                    .password(usuario.getPassword())
                    .rol(usuario.getRol())
                    .persona(usuario.getPersona())
                    .activo(usuario.getActivo())
                    .build();
        }
        return null;
    }
}
