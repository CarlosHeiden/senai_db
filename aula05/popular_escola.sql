
USE escola;

-- Inserir departamentos
INSERT INTO departamento (departamento_nome) VALUES 
('Matemática'),
('Ciências'),
('Linguagens'),
('Humanas');

-- Inserir professores
INSERT INTO professor (professor_nome, departamento_iddepartamento) VALUES 
('Ana Souza', 1),
('Bruno Lima', 2),
('Carlos Mendes', 3),
('Daniela Rocha', 4);

-- Inserir disciplinas
INSERT INTO disciplina (disciplina_nome, departamento_iddepartamento) VALUES 
('Álgebra', 1),
('Biologia', 2),
('Português', 3),
('História', 4);

-- Inserir turmas
INSERT INTO turma (turma_horario, disciplina_iddisciplina) VALUES 
('Segunda 08:00', 1),
('Terça 10:00', 2),
('Quarta 14:00', 3),
('Quinta 16:00', 4);

-- Inserir alunos
INSERT INTO aluno (aluno_nome, aluno_sexo, aluno_data_nasc, aluno_nome_pai, aluno_nome_mae) VALUES 
('João Pedro', 'Masculino', '2007-03-15', 'Carlos Pedro', 'Marina Pedro'),
('Mariana Silva', 'Feminino', '2006-07-09', 'Roberto Silva', 'Eliane Silva'),
('Lucas Costa', 'Masculino', '2007-01-22', 'Fernando Costa', 'Sueli Costa'),
('Beatriz Almeida', 'Feminino', '2006-11-30', 'Paulo Almeida', 'Regina Almeida'),
('Fernanda Lima', 'Feminino', '2006-05-11', 'Cláudio Lima', 'Marta Lima'),
('Rafael Torres', 'Masculino', '2007-09-18', 'Marcelo Torres', 'Aline Torres'),
('Juliana Rocha', 'Feminino', '2006-08-02', 'Eduardo Rocha', 'Patrícia Rocha'),
('Gabriel Martins', 'Masculino', '2007-12-07', 'Henrique Martins', 'Célia Martins'),
('Isabela Duarte', 'Feminino', '2007-10-10', 'Sérgio Duarte', 'Luciana Duarte'),
('Mateus Oliveira', 'Masculino', '2006-04-25', 'Otávio Oliveira', 'Janaína Oliveira'),
('Amanda Ribeiro', 'Feminino', '2007-03-30', 'Rogério Ribeiro', 'Tatiane Ribeiro'),
('Thiago Costa', 'Masculino', '2006-06-21', 'André Costa', 'Valéria Costa'),
('Larissa Campos', 'Feminino', '2007-11-12', 'João Campos', 'Denise Campos'),
('Diego Freitas', 'Masculino', '2006-02-14', 'Fábio Freitas', 'Bianca Freitas'),
('Sofia Mendes', 'Feminino', '2006-01-05', 'Luciano Mendes', 'Cristiane Mendes'),
('Leonardo Brito', 'Masculino', '2007-05-26', 'Jorge Brito', 'Sandra Brito'),
('Camila Teixeira', 'Feminino', '2007-07-03', 'Pedro Teixeira', 'Renata Teixeira'),
('Eduardo Nunes', 'Masculino', '2006-10-17', 'Marcos Nunes', 'Simone Nunes'),
('Vitória Lopes', 'Feminino', '2007-08-08', 'Renan Lopes', 'Michele Lopes'),
('Bruno Farias', 'Masculino', '2006-03-19', 'Alex Farias', 'Elaine Farias');

-- Inserir aproveitamentos
INSERT INTO aproveitamento (aproveitamento_nota, aluno_idaluno, turma_idturma, professor_idprofessor) VALUES 
(8.5, 1, 1, 1),
(7.0, 2, 2, 2),
(9.2, 3, 3, 3),
(6.8, 4, 4, 4),
(8.0, 1, 3, 3),
(7.5, 2, 1, 1),
(9.0, 3, 2, 2),
(7.8, 4, 1, 1),
(7.0, 5, 2, 2),
(6.5, 6, 3, 3),
(8.7, 7, 1, 1),
(9.5, 8, 4, 4),
(5.9, 9, 2, 2),
(7.8, 10, 3, 3),
(6.2, 11, 1, 1),
(8.1, 12, 4, 4),
(7.4, 13, 2, 2),
(8.9, 14, 3, 3),
(9.3, 15, 1, 1),
(6.8, 16, 4, 4),
(7.6, 17, 2, 2),
(5.5, 18, 3, 3),
(8.4, 19, 1, 1),
(9.0, 20, 4, 4),
(7.5, 5, 3, 3),
(6.9, 6, 4, 4),
(8.2, 7, 2, 2),
(7.1, 8, 1, 1),
(6.6, 9, 4, 4),
(9.8, 10, 2, 2),
(8.0, 11, 3, 3),
(5.7, 12, 1, 1),
(7.3, 13, 4, 4),
(6.0, 14, 2, 2),
(9.1, 15, 3, 3),
(8.6, 16, 1, 1),
(7.2, 17, 4, 4),
(6.4, 18, 2, 2);
