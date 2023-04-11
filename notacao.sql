Pessoal, conforme conversado em aula, nossa primeira avaliação ocorrerá dia 11/04/2023. 
O conteúdo será Mapeamento de Tabela, Repository, Serviço e Controller. Para ser avaliada a aplicação deve rodar.

Dependencias -
    Spring Boot DevTools
    Spring Data JPA 
    Spring Web
    (MySQL Driver) or (Oracle Driver)
    (opcional) - Lombok

Importante lembrar -
    --<version>2.7.9</version>
    --<java.version>11</java.version>
    --mvn clean spring-boot:run

------------------------------------------------------------------------------
-- CRIAÇÃO DO BANCO --

-- create schema anotacao;

-- use anotacao;

-- create user 'user'@'localhost' identified by 'pass123';

-- grant select, insert, delete, update on anotacao.* to user@'localhost';

-- create table usr_usuario (
--   usr_id bigint unsigned not null auto_increment,
--   usr_nome varchar(20) not null,
--   usr_senha varchar(100) not null,
--   primary key (usr_id),
--   unique key uni_usuario_nome (usr_nome)
-- );

-- UTILIZAR O COMANDO NO TERMINAL DO GIT POD --
mysql < DDL.sql
mysql < Insert.sql

------------------------------------------------------------------------------

-- EM APPLICATION.PROPERTIES --
-- ## Logging
-- # Show sql statement
-- logging.level.org.hibernate.SQL=debug

-- # Show sql values
-- logging.level.org.hibernate.type.descriptor.sql=trace

-- ## Spring DATASOURCE (DataSourceAutoConfiguration & DataSourceProperties)
-- spring.datasource.url = jdbc:mysql://localhost:3306/anotacao?useTimezone=true&serverTimezone=UTC
-- spring.datasource.username = user
-- spring.datasource.password = pass123

-- ## Hibernate Properties
-- # The SQL dialect makes Hibernate generate better SQL for the chosen database
-- spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.MySQL5Dialect

-- # Hibernate ddl auto (create, create-drop, validate, update)
-- spring.jpa.hibernate.ddl-auto = validate

------------------------------------------------------------------------------

-- CRIAR ENTITY / CONTROLLER / REPOSITORY / SERVICE --
-- ENTITY > SERVICE > iSERVICE > REPOSITORY > CONTROLLER

------------------------------------------------------------------------------
-- ENTITY --
@Entity
@Data
@Table(name = "usr_usuario")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "usr_id")
    private Long id;

    @Column(name = "usr_nome")
    private String nome;

    @Column(name = "usr_senha")
    private String senha;
}

-- CONTROLLER --
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

-- REPOSITORY -- 
public interface UsuarioRepository  extends JpaRepository<Usuario, Long>{
    public Usuario findByNome(String nome);
}

-- SERVICE INTERFACE -- 
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

-- SERVICE -- 
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


------------------------------------------------------------------------------

-- TESTE NO POSTMAN --

-- LISTAR TODOS --
--https://8080-aldrikalvar-estudoprova-xqoeup2ky1g.ws-us93.gitpod.io/usuario/listarTodes
-- [
--     {
--         "id": 1,
--         "nome": "admin",
--         "senha": "$2a$10$i3.Z8Yv1Fwl0I5SNjdCGkOTRGQjGvHjh/gMZhdc3e7LIovAklqM6C"
--     },
--     {
--         "id": 4,
--         "nome": "aldrik",
--         "senha": "123"
--     }
-- ]


-- INSERIR --
--https://8080-aldrikalvar-estudoprova-xqoeup2ky1g.ws-us93.gitpod.io/usuario/inserir
-- {
--     "nome": "aldrik",
--     "senha": "123"
-- }

-- DELETAR --
---https://8080-aldrikalvar-estudoprova-xqoeup2ky1g.ws-us93.gitpod.io/usuario/deletar
-- {
--     "id":4,
--     "nome": "aldrik",
--     "senha": "123"
-- }





