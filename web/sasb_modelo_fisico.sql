/**
 * Author:  Alex Souza
 * Created: 21/02/2019
 */
SQL>
  2  create database sasb;
  3  use sasb;

SQL> create table cliente(
  2  cd_cpf_cliente varchar(20) primary key,
  3  nome varchar(100),
  4  sobrenome varchar(100),
  5  telefone varchar(30)
  6* );
SQL> /

Tabela criada.

SQL> create table cargo(
  2  cd_cargo integer not null primary key,
  3  nome varchar(100),
  4  salario varchar(20)
  5* );
SQL> /

Tabela criada.

SQL> create table funcionario(
  2  cd_cpf_funcionario varchar(20) not null primary key,
  3  nome varchar(100),
  4  sobrenome varchar(100),
  5  telefone varchar(30),
  6  comissao varchar(20),
  7  cd_cargo integer,
  8  constraint cargo_cd_cargo_fk foreign key(cd_cargo)
  9  references cargo(cd_cargo)
 10*  );
SQL> /

Tabela criada.

SQL> create table perfil(
  2  cd_perfil integer not null primary key auto_increment,
  3  nome varchar(30)
  4* );
SQL> /

Tabela criada.

SQL> create table usuario(
  2  cd_usuario integer not null primary key,
  3  cd_cpf_funcionario varchar(20),
  4  senha varchar(100),
  5  cd_perfil integer not null,  
  6  constraint f_cd_cpf_funcionario_fk foreign key(cd_cpf_funcionario)
  7  references funcionario(cd_cpf_funcionario),
  8  constraint perfil_cd_perfil  foreign key(cd_perfil)
  9  references perfil(cd_perfil)
 10*  );
SQL> /

Tabela criada.

SQL> create table procedimento(
  2  cd_procedimento integer not null primary key,
  3  nome varchar(100)
  5* );
SQL> /

Tabela criada.

SQL> create table agendamento(
  2  cd_agendamento integer not null primary key,
  3  data datetime,
  4  hora time,
  5  cd_cpf_cliente varchar(20) not null,
  6  cd_cpf_funcionario varchar(20) not null,
  7  cd_procedimento integer not null,
  8  constraint cli_cd_cpf_cliente_fk foreign key(cd_cpf_cliente)
  9  references cliente(cd_cpf_cliente),
 10  constraint fcn_cd_cpf_funcionario_fk foreign key(cd_cpf_funcionario)
 11  references funcionario(cd_cpf_funcionario),
 12  constraint pto_cd_procedimento_fk foreign key(cd_procedimento)
 13  references procedimento(cd_procedimento)
 14* );
SQL> /

Tabela criada.


SQL> CREATE FUNCTION formatar_cpf(cpf VARCHAR(11))
  2  RETURNS VARCHAR(14)    
  3 	 BEGIN
  4
  5 		 RETURN CONCAT(
  6   			 SUBSTRING(cpf,1,3) , '.',  	 
  7 			 SUBSTRING(cpf,4,3), '.',
  8 			 SUBSTRING(cpf,1,3), '-',
  9 			 SUBSTRING(cpf,1,3)
 10 		 );
 11
 12 	 END
    
SQL> CREATE FUNCTION formatar_celular(celular VARCHAR(11))
  2  RETURNS VARCHAR(15)    
  3 	 BEGIN
  4
  5 		 RETURN CONCAT(
  6   			 SUBSTRING(celular,1,0), '(',  	 
  7 			 SUBSTRING(celular,1,2), ')',
  8 			 SUBSTRING(celular,2,0), ' ',
  9   		 	 SUBSTRING(celular,3,5), '-',
 10 			 SUBSTRING(celular,8,4)
 11 		 );
 12
 13 	 END

SQL> /

SQL> spool off;


