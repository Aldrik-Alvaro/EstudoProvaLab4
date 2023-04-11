package pre.provalabiv.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.bytebuddy.asm.Advice.Return;
import pre.provalabiv.demo.entity.Usuario;
import pre.provalabiv.demo.service.IUsuarioService;

@RestController
@CrossOrigin
@RequestMapping(value = "/usuario")
public class UsuarioController {
    
    @Autowired
    private IUsuarioService service;

    // REQUISIÇÃO PARA PESQUISAR UM NOVO USUARIO //
    @GetMapping(value = "/pesquisar/{usuario}")
    public Usuario buscarPorId(@PathVariable("usuario") Long id) {
        return service.buscarPorId(id);
    }

    // REQUISIÇÃO PARA CRIAR UM NOVO USUARIO //
    @PostMapping(value =  "/inserir")
    public Usuario novoUsuario(@RequestBody Usuario usuario){
        return service.novoUsuario(usuario);
    }

    // REQUISIÇÃO PARA DELETAR UM NOVO USUARIO //
    @PostMapping(value = "/deletar")
    public void deletarUsuario(@RequestBody Usuario usuario){
        service.deletarUsuario(usuario);
        System.out.println("DELETADO COM SUCESSO");
    }

    // REQUISIÇÃO PARA LISTAR TODES//
    @GetMapping(value = "/listarTodes")
    public List<Usuario> finddAllUsuario() {
        return service.findAllUsuario();
    }


}
