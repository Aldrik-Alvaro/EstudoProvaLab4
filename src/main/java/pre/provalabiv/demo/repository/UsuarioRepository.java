package pre.provalabiv.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pre.provalabiv.demo.entity.Usuario;

public interface UsuarioRepository  extends JpaRepository<Usuario, Long>{

    public Usuario findByNome(String nome);
}
