-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS petvida;
USE petvida;

-- Tabela CLIENTES
CREATE TABLE CLIENTES (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    endereco VARCHAR(255)
);

-- Tabela ANIMAIS
CREATE TABLE ANIMAIS (
    id_animal INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raca VARCHAR(50),
    porte VARCHAR(20),
    data_nascimento DATE,
    sexo CHAR(1),
    status VARCHAR(20) DEFAULT 'Ativo',
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTES(id_cliente) ON DELETE CASCADE
);

-- Tabela VETERINARIOS
CREATE TABLE VETERINARIOS (
    id_veterinario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    crmv VARCHAR(20) UNIQUE NOT NULL,
    especialidade VARCHAR(100),
    telefone VARCHAR(20)
);

-- Tabela CONSULTAS
CREATE TABLE CONSULTAS (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    data_consulta DATE NOT NULL,
    hora_consulta TIME NOT NULL,
    descricao TEXT,
    id_animal INT NOT NULL,
    id_veterinario INT NOT NULL,
    FOREIGN KEY (id_animal) REFERENCES ANIMAIS(id_animal) ON DELETE CASCADE,
    FOREIGN KEY (id_veterinario) REFERENCES VETERINARIOS(id_veterinario) ON DELETE RESTRICT
);

-- Tabela VACINAS
CREATE TABLE VACINAS (
    id_vacina INT PRIMARY KEY AUTO_INCREMENT,
    nome_vacina VARCHAR(100) NOT NULL UNIQUE,
    tipo_vacina VARCHAR(50),
    validade DATE
);

-- Tabela TRATAMENTOS
CREATE TABLE TRATAMENTOS (
    id_tratamento INT PRIMARY KEY AUTO_INCREMENT,
    nome_tratamento VARCHAR(100) NOT NULL UNIQUE,
    tipo_tratamento VARCHAR(50),
    descricao_tratamento TEXT
);

-- Tabela APLICACAO_VACINAS
CREATE TABLE APLICACAO_VACINAS (
    id_aplicacao_vacina INT PRIMARY KEY AUTO_INCREMENT,
    data_aplicacao DATE NOT NULL,
    id_animal INT NOT NULL,
    id_vacina INT NOT NULL,
    id_veterinario INT NOT NULL,
    FOREIGN KEY (id_animal) REFERENCES ANIMAIS(id_animal) ON DELETE CASCADE,
    FOREIGN KEY (id_vacina) REFERENCES VACINAS(id_vacina) ON DELETE RESTRICT,
    FOREIGN KEY (id_veterinario) REFERENCES VETERINARIOS(id_veterinario) ON DELETE RESTRICT,
    UNIQUE (id_animal, id_vacina, data_aplicacao)
);

-- Tabela REALIZACAO_TRATAMENTOS
CREATE TABLE REALIZACAO_TRATAMENTOS (
    id_realizacao_tratamento INT PRIMARY KEY AUTO_INCREMENT,
    data_realizacao DATE NOT NULL,
    observacoes TEXT,
    id_animal INT NOT NULL,
    id_tratamento INT NOT NULL,
    id_veterinario INT NOT NULL,
    FOREIGN KEY (id_animal) REFERENCES ANIMAIS(id_animal) ON DELETE CASCADE,
    FOREIGN KEY (id_tratamento) REFERENCES TRATAMENTOS(id_tratamento) ON DELETE RESTRICT,
    FOREIGN KEY (id_veterinario) REFERENCES VETERINARIOS(id_veterinario) ON DELETE RESTRICT
);

-- Tabela AGENDAMENTOS
CREATE TABLE AGENDAMENTOS (
    id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
    data_agendamento DATE NOT NULL,
    hora_agendamento TIME NOT NULL,
    tipo_agendamento VARCHAR(50) NOT NULL,
    observacoes TEXT,
    id_animal INT NOT NULL,
    id_veterinario INT NOT NULL,
    FOREIGN KEY (id_animal) REFERENCES ANIMAIS(id_animal) ON DELETE CASCADE,
    FOREIGN KEY (id_veterinario) REFERENCES VETERINARIOS(id_veterinario) ON DELETE RESTRICT
);

-- CLIENTES
INSERT INTO CLIENTES (nome_completo, cpf, telefone, email, endereco) VALUES
('Ana Souza', '123.456.789-00', '11999990001', 'ana@email.com', 'Rua das Flores, 123'),
('Carlos Heiden', '234.567.890-11', '11999990002', 'carlos@email.com', 'Av. Brasil, 456'),
('Fernanda Lima', '345.678.901-22', '11999990003', 'fernanda@email.com', 'Rua Verde, 789'),
('João Pedro', '456.789.012-33', '11999990004', 'joao@email.com', 'Travessa Azul, 321'),
('Marina Costa', '567.890.123-44', '11999990005', 'marina@email.com', 'Alameda Mar, 654');

-- VETERINARIOS
INSERT INTO VETERINARIOS (nome, crmv, especialidade, telefone) VALUES
('Dra. Carla Mendes', 'CRMV-1234', 'Clínica Geral', '11988887777'),
('Dr. Marcos Silva', 'CRMV-2345', 'Dermatologia', '11988886666'),
('Dra. Paula Rocha', 'CRMV-3456', 'Cardiologia', '11988885555'),
('Dr. Henrique Dias', 'CRMV-4567', 'Ortopedia', '11988884444'),
('Dra. Aline Teixeira', 'CRMV-5678', 'Cirurgia', '11988883333');

-- ANIMAIS
INSERT INTO ANIMAIS (nome, especie, raca, porte, data_nascimento, sexo, id_cliente) VALUES
('Rex', 'Cachorro', 'Labrador', 'Grande', '2019-06-01', 'M', 1),
('Mimi', 'Gato', 'Siamês', 'Pequeno', '2020-03-15', 'F', 2),
('Tobias', 'Cachorro', 'Poodle', 'Médio', '2018-08-21', 'M', 3),
('Nina', 'Gato', 'Persa', 'Pequeno', '2021-01-10', 'F', 4),
('Thor', 'Cachorro', 'Bulldog', 'Grande', '2022-02-22', 'M', 5);

-- CONSULTAS
INSERT INTO CONSULTAS (data_consulta, hora_consulta, descricao, id_animal, id_veterinario) VALUES
('2025-07-01', '10:00:00', 'Consulta de rotina', 1, 1),
('2025-07-02', '11:00:00', 'Exame de pele', 2, 2),
('2025-07-03', '09:30:00', 'Check-up', 3, 1),
('2025-07-04', '14:00:00', 'Problema cardíaco', 4, 3),
('2025-07-05', '16:00:00', 'Avaliação ortopédica', 5, 4);

-- VACINAS
INSERT INTO VACINAS (nome_vacina, tipo_vacina, validade) VALUES
('V10', 'Polivalente', '2026-12-31'),
('Raiva', 'Antirrábica', '2027-06-30'),
('Giárdia', 'Bacteriana', '2025-10-15'),
('Leptospirose', 'Bacteriana', '2025-08-01'),
('Gripe Canina', 'Viral', '2026-01-20');

-- TRATAMENTOS
INSERT INTO TRATAMENTOS (nome_tratamento, tipo_tratamento, descricao_tratamento) VALUES
('Antibiótico', 'Medicamento', 'Uso oral por 7 dias'),
('Curativo', 'Procedimento', 'Curativo local com pomada'),
('Fisioterapia', 'Reabilitação', 'Sessões semanais'),
('Cirurgia de hérnia', 'Cirurgia', 'Procedimento cirúrgico'),
('Terapia para pele', 'Dermatológico', 'Uso de shampoo e pomadas');

-- APLICACAO_VACINAS
INSERT INTO APLICACAO_VACINAS (data_aplicacao, id_animal, id_vacina, id_veterinario) VALUES
('2025-07-06', 1, 1, 1),
('2025-07-06', 2, 2, 2),
('2025-07-06', 3, 1, 1),
('2025-07-07', 4, 3, 3),
('2025-07-07', 5, 2, 2);

-- REALIZACAO_TRATAMENTOS
INSERT INTO REALIZACAO_TRATAMENTOS (data_realizacao, observacoes, id_animal, id_tratamento, id_veterinario) VALUES
('2025-07-08', 'Animal respondeu bem ao antibiótico', 1, 1, 1),
('2025-07-08', 'Lesão tratada com sucesso', 2, 2, 2),
('2025-07-09', 'Sessão realizada com exercícios leves', 3, 3, 4),
('2025-07-10', 'Cirurgia bem-sucedida', 4, 4, 5),
('2025-07-11', 'Pele hidratada e sem irritações', 5, 5, 2);

-- AGENDAMENTOS
INSERT INTO AGENDAMENTOS (data_agendamento, hora_agendamento, tipo_agendamento, observacoes, id_animal, id_veterinario) VALUES
('2025-07-20', '09:00:00', 'Consulta', 'Revisão anual', 1, 1),
('2025-07-21', '11:30:00', 'Vacinação', 'Aplicar V10', 2, 2),
('2025-07-22', '10:00:00', 'Retorno', 'Verificar recuperação', 3, 1),
('2025-07-23', '14:00:00', 'Consulta', 'Possível infecção de ouvido', 4, 3),
('2025-07-24', '15:00:00', 'Consulta', 'Dores articulares', 5, 4);

-- Listar nome do animal, nome do cliente e veterinário da consulta
SELECT a.nome AS animal, c.nome_completo AS cliente, v.nome AS veterinario, cs.data_consulta
FROM CONSULTAS cs
INNER JOIN ANIMAIS a ON cs.id_animal = a.id_animal
INNER JOIN CLIENTES c ON a.id_cliente = c.id_cliente
INNER JOIN VETERINARIOS v ON cs.id_veterinario = v.id_veterinario
WHERE cs.data_consulta >= '2025-07-01';

-- Adicionar campo 'observacoes' em VACINAS
ALTER TABLE VACINAS ADD observacoes TEXT;
SELECT * FROM VACINAS;

UPDATE VACINAS SET observacoes = 'manter refrigerada' WHERE nome_vacina = 'V10';
SELECT * FROM VACINAS;

-- Remover uma vacina específica
DELETE FROM VACINAS WHERE nome_vacina = "Leptospirose";
SELECT * FROM VACINAS;

-- Mostrar todos os animais e se possuem consulta marcada
SELECT a.nome, cs.data_consulta
FROM ANIMAIS a
LEFT JOIN CONSULTAS cs ON a.id_animal = cs.id_animal;

-- Número de consultas por veterinário com 1 ou mais atendimentos
SELECT v.nome, COUNT(cs.id_consulta) AS total_consultas
FROM CONSULTAS cs
JOIN VETERINARIOS v ON cs.id_veterinario = v.id_veterinario
GROUP BY v.nome
HAVING total_consultas > 0
ORDER BY total_consultas DESC;

SELECT 
    'Consulta' AS tipo_evento,
    a.nome AS nome_animal,
    c.nome_completo AS nome_tutor,
    cs.data_consulta AS data_evento,
    cs.hora_consulta AS hora_evento,
    v.nome AS veterinario,
    cs.descricao AS detalhes
FROM CONSULTAS cs
JOIN ANIMAIS a ON cs.id_animal = a.id_animal
JOIN CLIENTES c ON a.id_cliente = c.id_cliente
JOIN VETERINARIOS v ON cs.id_veterinario = v.id_veterinario
WHERE a.nome = 'Rex'

UNION ALL

SELECT 
    'Vacinação' AS tipo_evento,
    a.nome AS nome_animal,
    c.nome_completo AS nome_tutor,
    av.data_aplicacao AS data_evento,
    NULL AS hora_evento,
    v.nome AS veterinario,
    CONCAT('Vacina: ', va.nome_vacina, ' (', va.tipo_vacina, ')') AS detalhes
FROM APLICACAO_VACINAS av
JOIN ANIMAIS a ON av.id_animal = a.id_animal
JOIN CLIENTES c ON a.id_cliente = c.id_cliente
JOIN VACINAS va ON av.id_vacina = va.id_vacina
JOIN VETERINARIOS v ON av.id_veterinario = v.id_veterinario
WHERE a.nome = 'Rex'

UNION ALL

SELECT 
    'Tratamento' AS tipo_evento,
    a.nome AS nome_animal,
    c.nome_completo AS nome_tutor,
    rt.data_realizacao AS data_evento,
    NULL AS hora_evento,
    v.nome AS veterinario,
    CONCAT('Tratamento: ', t.nome_tratamento, ' - ', rt.observacoes) AS detalhes
FROM REALIZACAO_TRATAMENTOS rt
JOIN ANIMAIS a ON rt.id_animal = a.id_animal
JOIN CLIENTES c ON a.id_cliente = c.id_cliente
JOIN TRATAMENTOS t ON rt.id_tratamento = t.id_tratamento
JOIN VETERINARIOS v ON rt.id_veterinario = v.id_veterinario
WHERE a.nome = 'Rex'

ORDER BY data_evento DESC;






