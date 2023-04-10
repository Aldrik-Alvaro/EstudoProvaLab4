Pessoal, conforme conversado em aula, nossa primeira avaliação ocorrerá dia 11/04/2023. 

O conteúdo será Mapeamento de Tabela, Repository, Serviço e Controller. Para ser avaliada a aplicação deve rodar.

Dependencias
    Spring Boot DevTools
    Spring Data JPA 
    Spring Web
    (MySQL Driver) or (Oracle Driver)

    (opcional) - Lombok

Importante
    --<version>2.7.9</version>
    --<java.version>11</java.version>
    --Mvn clean spring-boot:run
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

-- UTILIZAR O COMANDO NO TERMINAL DO GIT POD
mysql < DDL.sql

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


-- ENTITY --
@Entity
@Data
@Table(name = "usr_usuario")

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "usr_id")

























