package pre.provalabiv.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pre.provalabiv.demo.entity.Usuario;
import pre.provalabiv.demo.service.IUsuarioService;

@RestController
@CrossOrigin
@RequestMapping(value = "/usuario")
public class UsuarioController {
    
    
    @Autowired
    private IUsuarioService service;

    @GetMapping(value = "/id/{usuario}")
    public Usuario buscarPorId(@PathVariable("usuario") Long id) {
        return service.buscarPorId(id);
    }
}
