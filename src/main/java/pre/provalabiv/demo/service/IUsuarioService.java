package pre.provalabiv.demo.service;

import java.util.List;

import pre.provalabiv.demo.entity.Usuario;

public interface IUsuarioService {

    // PARA PESQUISAR UM USUARIO //
    public Usuario buscarPorId(Long id);

    // PARA INSERIR UM USUARIO //
    public Usuario novoUsuario(Usuario usuario);

    // PARA DELETAR UM USUARIO //
    public void deletarUsuario(Usuario usuario);

    // PARA VOLTAR TODOS OS USUARIOS //
    public List<Usuario> findAllUsuario();
     
}
