CREATE DATABASE DB_ESCOLA_JOIN;
USE DB_ESCOLA_JOIN;
drop database DB_ESCOLA_JOIN

CREATE TABLE Alunos (
    cod INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

-- Inserindo dados na tabela Alunos
INSERT INTO Alunos (cod, nome, cidade) VALUES
(1, 'Carlos', 'Sorocaba'),
(2, 'Beatriz', 'Itu'),
(3, 'Lucas', 'Votorantim');

-- Criando a tabela Matriculas
CREATE TABLE Matriculas (
    cod INT PRIMARY KEY,
    valor DECIMAL(10, 2),
    data DATE,
    cod_aluno INT,
    FOREIGN KEY (cod_aluno) REFERENCES Alunos(cod)
);

-- Inserindo dados na tabela Matriculas
INSERT INTO Matriculas (cod, valor, data, cod_aluno) VALUES
(1, 180.00, '2023-10-10', 1),
(2, 250.00, '2023-10-11', 2),
(3, 400.00, '2023-10-12', 1);


-- 1. Inserção de registros
INSERT INTO Matriculas (cod, valor, data, cod_aluno) VALUES
(4, 500.00, '2023-10-13', 3),
(5, 600.00, '2023-10-14', 4),
(6, 700.00, '2023-10-15', 5),
(7, 800.00, '2023-10-16', 6),
(8, 900.00, '2023-10-17', 7),
(9, 1000.00, '2023-10-18', 8),
(10, 1800.00, '2023-10-19', 9);

INSERT INTO Alunos (cod, nome, cidade) VALUES
(4, 'Gabriel', 'Praia Grande'),
(5, 'Julia', 'Guaruja'),
(6, 'Thomas', 'Tatui'),
(7, 'Joao', 'Santos'),
(8, 'Sarah', 'São Paulo'),
(9, 'Arthur', 'Campinas'),
(10, 'Carlos', 'Santo Andre');

-- 2. Alunos matriculados
select
alunos.nome as nome_aluno,
alunos.cidade as cidade_aluno,
matriculas.valor as valor_matricula
from alunos 
inner join matriculas
on alunos.cod = matriculas.cod_aluno;
    
   -- 3. Todos os alunos e suas matrículas
select 
alunos.nome as nome_aluno,
alunos.cidade as cidade_aluno,
matriculas.valor as valor_matricula
from alunos 
left join matriculas
on alunos.cod = matriculas.cod_aluno;

-- 4. Matrículas e alunos correspondentes
select 
alunos.nome as nome_aluno,
alunos.cidade as cidade_aluno,
matriculas.valor as valor_matricula
from matriculas 
right join alunos
on alunos.cod = matriculas.cod_aluno;

-- 5. Alunos sem matrícula
select 
alunos.nome as nome_aluno,
alunos.cidade as cidade_aluno
from alunos 
left join matriculas 
on alunos.cod = matriculas.cod_aluno
where matriculas.cod is null;

-- 6. Matrículas acima de determinado valor
select 
alunos.nome as nome_aluno,
matriculas.valor as valor_matricula
from matriculas 
right join alunos 
on alunos.cod = matriculas.cod_aluno
where matriculas.valor > 200.00 ;

-- 7. Matrículas de outubro de 2023
select 
alunos.nome as nome_aluno,
matriculas.data as data_matricula,
matriculas.valor as valor_matricula
from alunos 
inner join matriculas 
on alunos.cod = matriculas.cod_aluno
where matriculas.data between '2023-10-01' and '2023-10-31';