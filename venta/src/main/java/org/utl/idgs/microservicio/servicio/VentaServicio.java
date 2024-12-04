package org.utl.idgs.microservicio.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.utl.idgs.microservicio.dto.VentaDto;
import org.utl.idgs.microservicio.entidad.Venta;
import org.utl.idgs.microservicio.repositorio.VentaRepositorio;

import java.util.List;
import java.util.Optional;

@Service
public class VentaServicio {

    @Autowired
    private VentaRepositorio ventaRepositorio;

    public VentaDto crear(VentaDto ventaDto) {
        try {
            Venta venta = Venta.builder()
                    .fecha(ventaDto.getFecha())
                    .empleado(ventaDto.getEmpleado())
                    .cliente(ventaDto.getCliente())
                    .build();
            return construirDto(ventaRepositorio.save(venta));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<Venta> listar() {
        return ventaRepositorio.findAll();
    }

    public Venta obtener(Long id) {
        Optional<Venta> venta = ventaRepositorio.findById(id);
        return venta.orElse(null);
    }

    public VentaDto modificar(Venta venta) {
        try {
            obtener(venta.getId());
            return construirDto(ventaRepositorio.save(venta));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private VentaDto construirDto(Venta venta) {
        return VentaDto.builder()
                .id(venta.getId())
                .fecha(venta.getFecha())
                .empleado(venta.getEmpleado())
                .cliente(venta.getCliente())
                .build();
    }
}
