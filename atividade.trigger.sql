create database triger;

-- 1.

CREATE TRIGGER validar_data_validade
BEFORE INSERT ON tabela_de_produtos
FOR EACH ROW
BEGIN
    IF NEW.data_de_validade 
    IF NEW.data
< CURDATE() THEN
        SIGNAL SQLSTATE '55000' SET MESSAGE_TEXT = 'A data de validade já passou.';
    END IF;
END;

-- 2.

CREATE TRIGGER aumentar_preco_produto
BEFORE UPDATE ON tabela_de_produtos
FOR EACH ROW
BEGIN
    SET NEW.preco = NEW.preco * 1.1;
END;


-- 3. 

CREATE TRIGGER atualizar_estoque_venda
AFTER INSERT ON tabela_de_vendas
FOR EACH ROW
BEGIN
    UPDATE tabela_de_produtos
    SET estoque = estoque - NEW.quantidade
    WHERE produto_id = NEW.produto_id;
END;

-- 4. 

CREATE TRIGGER mover_para_tabela_demitidos
AFTER DELETE ON tb_funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO tb_funcionarios_demitidos (funcionario_id, nome, data_de_demissao)
    VALUES (OLD.funcionario_id, OLD.nome, CURDATE());
END;


-- 5. 

CREATE TRIGGER excluir_dependente
AFTER DELETE ON tb_funcionarios
FOR EACH ROW
BEGIN
    DELETE FROM tb_dependentes WHERE funcionario_id = OLD.funcionario_id;
END;



