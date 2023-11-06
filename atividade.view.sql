-- VIEW

create database view;

 -- 1.
 Create table view.Funcionarios(
 ID int primary key auto_increment,
 Nome varchar(255)
 );
 
 insert into view.Funcionarios(Nome)
 Values("Felipe");
 
  insert into view.Funcionarios(Nome)
 Values("João");
 
  insert into view.Funcionarios(Nome)
 Values("Meliodas");
 
 Create table view.Departamento(
 ID int primary key auto_increment,
 Cargo Varchar(255) not null,
 Id_Funcionarios int,
 foreign key (Id_Funcionarios) references view.Funcionarios(ID)
 );
 
 insert into view.Departamento(Cargo,Id_Funcionarios)
 Values('Administrativo',1);
 
insert into view.Departamento(Cargo,Id_Funcionarios)
 Values('Financeiro',2);
 
  insert into view.Departamento(Cargo,Id_Funcionarios)
 Values('Administrativo',3);
 
 Create view view.vw_funcionarios_departamento as
 select 
 F.Nome,
 D.Cargo
 From view.Funcionarios F
 inner join view.Departamento D
  on F.ID = Id_Funcionarios
  where D.Cargo='Administrativo';
 
 
 SELECT * FROM view.vw_funcionarios_departamento;
 
 
 

-- 2. 

 Create table view.Produtos(
 ID int primary key auto_increment,
 Nome varchar(255) not null,
 Estoque int
 );
 
 insert into view.Produtos(Nome,Estoque)
 Values("Desinfetante",4);
 
  insert into view.Produtos(Nome,Estoque)
 Values("Sabonte",2);
 
  insert into view.Produtos(Nome,Estoque)
 Values("Detergente",10);
 
 Create View view.vw_estoque_insuficiente as
 select Nome,Estoque
 From view.Produtos
 where Estoque < 5;
 
 Select * from view.vw_estoque_insuficiente;
 
 
-- 3. 

CREATE TABLE view.Clientes(
Id int primary key auto_increment,
Nome varchar(255) not null,
DataNascimento date not null,
Telefone varchar(22) not null,
IDVendedor int,
foreign key (IDVendedor) references Vendedor(Id)
);

CREATE TABLE view.Vendedor(
Id int primary key auto_increment,
Nome varchar(255) not null,
Produto varchar(255)
);

insert into view.Clientes(Nome,DataNascimento,Telefone,IDVendedor)
Values("Felipe","2003-06-06","(11) 11111-1111",1);

insert into view.Clientes(Nome,DataNascimento,Telefone,IDVendedor)
 Values("Raí","2010-10-10","(22) 22222-2222",2);
 
insert into view.Clientes(Nome,DataNascimento,Telefone,IDVendedor)
Values("Leonardo","2005-02-02","(71) 22456-5657",3);

insert into view.Vendedor(Nome,Produto)
 Values("Gabriel","Sapato");
 
 insert into view.Vendedor(Nome,Produto)
 Values("Manuella","Boné");
 
 insert into view.Vendedor(Nome,Produto)
 Values("Goku","Hamburguer");
 
 

 Create view view.vw_relacionamento_cliente_vendedor as
 select 
 C.Nome AS "Nome do Cliente",
 C.DataNascimento as "Data de Nascimento do Cliente",
 C.Telefone as "Telefone do Cliente",
 V.Nome as "Nome do Vendedor",
 V.Produto as "Produto do Vendedor"
 From view.Vendedor V
 inner join view.Clientes C 
on V.Id = C.IDVendedor;

select * from view.vw_relacionamento_cliente_vendedor;







-- 4. 

 Create table view.Produtos_Preco(
 ID int primary key auto_increment,
 Nome varchar(255) not null,
 Preco float
 );
 
 insert into view.Produtos_Preco(Nome,Preco)
 Values("Desinfetante",42.00);
 
  insert into view.Produtos_Preco(Nome,Preco)
 Values("Sabonete",20.00);
 
 insert into view.Produtos_Preco(Nome,Preco)
 Values("Detergente",24.00);
 
 Create View view.vw_produtos_caros as
 select Nome,Preco
 From view.Produtos_Preco
 where Preco > 100;
 
 Select * from view.vw_produtos_caros;
 
 -- 5. 

 Create table view.Pedidos(
 ID int primary key auto_increment,
 Nome varchar(255) not null,
 Status varchar(255) not null
 );
 
 insert into view.Pedidos(Nome,Status)
 Values("Chuveiro","Pendente");
 
insert into view.Pedidos(Nome,Status)
 Values("Vassoura","Entregue");
 
 insert into view.Pedidos(Nome,Status)
 Values("Perfume","Entregue");
 
 Create View view.vw_pedidos_pendentes as
 select Nome,Status
 From view.Pedidos
 where Status = "Pendente";
 
 Select * from view.vw_pedidos_pendentes;
 
 
 
 

