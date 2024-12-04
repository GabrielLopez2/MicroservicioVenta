package org.utl.idgs.microservicio.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.utl.idgs.microservicio.dto.VentaDto;
import org.utl.idgs.microservicio.entidad.Venta;
import org.utl.idgs.microservicio.servicio.VentaServicio;

import java.util.List;

@RestController
@RequestMapping("/api/venta")
public class VentaControlador {

    @Autowired
    private VentaServicio ventaServicio;

    @PostMapping
    public ResponseEntity<VentaDto> crear(@RequestBody VentaDto ventaDto) {
        try {
            VentaDto ventaCreada = ventaServicio.crear(ventaDto);
            return ResponseEntity.ok(ventaCreada);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(null);
        }
    }

    @GetMapping
    public ResponseEntity<List<Venta>> listar() {
        try {
            return ResponseEntity.ok(ventaServicio.listar());
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Venta> obtener(@PathVariable Long id) {
        Venta venta = ventaServicio.obtener(id);
        if (venta != null) {
            return ResponseEntity.ok(venta);
        }
        return ResponseEntity.notFound().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<VentaDto> modificar(@PathVariable Long id, @RequestBody Venta venta) {
        try {
            if (!id.equals(venta.getId())) {
                return ResponseEntity.badRequest().build();
            }
            VentaDto ventaModificada = ventaServicio.modificar(venta);
            return ResponseEntity.ok(ventaModificada);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(null);
        }
    }
}
