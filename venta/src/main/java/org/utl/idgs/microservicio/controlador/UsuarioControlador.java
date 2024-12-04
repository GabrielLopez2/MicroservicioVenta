package org.utl.idgs.microservicio.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.utl.idgs.microservicio.dto.UsuarioDto;
import org.utl.idgs.microservicio.entidad.Usuario;
import org.utl.idgs.microservicio.repositorio.PersonaRepositorio;
import org.utl.idgs.microservicio.repositorio.RolRepositorio;
import org.utl.idgs.microservicio.servicio.UsuarioServicio;

import java.util.List;

@RestController
@RequestMapping("/api/usuario")
public class UsuarioControlador {

    @Autowired
    private UsuarioServicio usuarioServicio;

    @Autowired
    private RolRepositorio rolRepositorio;

    @Autowired
    private PersonaRepositorio personaRepositorio;

    @PostMapping
    public ResponseEntity<UsuarioDto> crear(@RequestBody UsuarioDto usuarioDto) {
        try {
            // Validar que el rol está presente en el usuarioDto
            if (usuarioDto.getRol() == null || usuarioDto.getRol().getNombre() == null) {
                return ResponseEntity.badRequest().body(null); // Error si no se encuentra rol
            }

            // Buscar el rol por nombre
            var rol = rolRepositorio.findByNombre(usuarioDto.getRol().getNombre())
                    .orElseThrow(() -> new RuntimeException("Rol no encontrado")); // Lanzar error si el rol no existe

            // Asignar el rol encontrado al UsuarioDto
            usuarioDto.setRol(rol);

            // Si la persona no existe, se crea
            if (usuarioDto.getPersona() != null) {
                personaRepositorio.save(usuarioDto.getPersona());
            }

            // Crear el usuario
            UsuarioDto usuarioCreado = usuarioServicio.crear(usuarioDto);

            return ResponseEntity.ok(usuarioCreado); // Retornar el usuario creado
        } catch (Exception e) {
            // Manejo de excepciones en caso de error
            return ResponseEntity.badRequest().body(null);
        }
    }

    @GetMapping
    public ResponseEntity<List<Usuario>> listar() {
        try {
            return ResponseEntity.ok(usuarioServicio.listar());
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Usuario> obtener(@PathVariable Long id) {
        Usuario usuario = usuarioServicio.obtener(id);
        if (usuario != null) {
            return ResponseEntity.ok(usuario);
        }
        return ResponseEntity.notFound().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<UsuarioDto> modificar(@PathVariable Long id, @RequestBody Usuario usuario) {
        try {
            if (!id.equals(usuario.getId())) {
                return ResponseEntity.badRequest().build();
            }
            UsuarioDto usuarioModificado = usuarioServicio.modificar(usuario);
            return ResponseEntity.ok(usuarioModificado);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(null);
        }
    }
}
