package pre.provalabiv.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pre.provalabiv.demo.entity.Usuario;
import pre.provalabiv.demo.repository.UsuarioRepository;

@Service
public class UsuarioService implements IUsuarioService{
 
    @Autowired
    private UsuarioRepository usuarioRepo;


    public Usuario buscarPorId(Long id) {
        Optional<Usuario> usuarioOp = usuarioRepo.findById(id);
        if(usuarioOp.isPresent()) {
            return usuarioOp.get();
        }
        System.err.println("Id inválido!");
        return null;
    }

    public Usuario novoUsuario(Usuario usuario){
        return usuarioRepo.save(usuario);
    }
    
    public void deletarUsuario(Usuario usuario){ 
        usuarioRepo.delete(usuario);
    }

    public List<Usuario> findAllUsuario(){ 
        return usuarioRepo.findAll();
    }

}
