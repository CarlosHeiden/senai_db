
-- Criar schema e usar
CREATE SCHEMA IF NOT EXISTS escola DEFAULT CHARACTER SET utf8;
USE escola;

-- Tabela: aluno
CREATE TABLE IF NOT EXISTS aluno (
  idaluno INT NOT NULL AUTO_INCREMENT,
  aluno_nome VARCHAR(45) NOT NULL,
  aluno_sexo VARCHAR(45) NOT NULL,
  aluno_data_nasc DATE NOT NULL,
  aluno_nome_pai VARCHAR(45) NOT NULL,
  aluno_nome_mae VARCHAR(45) NOT NULL,
  PRIMARY KEY (idaluno)
) ENGINE=InnoDB;

-- Tabela: departamento
CREATE TABLE IF NOT EXISTS departamento (
  iddepartamento INT NOT NULL AUTO_INCREMENT,
  departamento_nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (iddepartamento)
) ENGINE=InnoDB;

-- Tabela: professor
CREATE TABLE IF NOT EXISTS professor (
  idprofessor INT NOT NULL AUTO_INCREMENT,
  professor_nome VARCHAR(45) NOT NULL,
  departamento_iddepartamento INT NOT NULL,
  PRIMARY KEY (idprofessor),
  CONSTRAINT fk_professor_departamento FOREIGN KEY (departamento_iddepartamento)
    REFERENCES departamento (iddepartamento)
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

-- Tabela: disciplina
CREATE TABLE IF NOT EXISTS disciplina (
  iddisciplina INT NOT NULL AUTO_INCREMENT,
  disciplina_nome VARCHAR(45) NOT NULL,
  departamento_iddepartamento INT NOT NULL,
  PRIMARY KEY (iddisciplina),
  CONSTRAINT fk_disciplina_departamento FOREIGN KEY (departamento_iddepartamento)
    REFERENCES departamento (iddepartamento)
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

-- Tabela: turma
CREATE TABLE IF NOT EXISTS turma (
  idturma INT NOT NULL AUTO_INCREMENT,
  turma_horario VARCHAR(45) NOT NULL,
  disciplina_iddisciplina INT NOT NULL,
  PRIMARY KEY (idturma),
  CONSTRAINT fk_turma_disciplina FOREIGN KEY (disciplina_iddisciplina)
    REFERENCES disciplina (iddisciplina)
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

-- Tabela: aproveitamento
CREATE TABLE IF NOT EXISTS aproveitamento (
  idaproveitamento INT NOT NULL AUTO_INCREMENT,
  aproveitamento_nota DECIMAL(10,2) NULL,
  aluno_idaluno INT NOT NULL,
  turma_idturma INT NOT NULL,
  professor_idprofessor INT NOT NULL,
  PRIMARY KEY (idaproveitamento),
  CONSTRAINT fk_aproveitamento_aluno FOREIGN KEY (aluno_idaluno)
    REFERENCES aluno (idaluno)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_aproveitamento_turma FOREIGN KEY (turma_idturma)
    REFERENCES turma (idturma)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_aproveitamento_professor FOREIGN KEY (professor_idprofessor)
    REFERENCES professor (idprofessor)
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;

-- Tabela: mensalidade
CREATE TABLE IF NOT EXISTS mensalidade (
  idmensalidade INT NOT NULL AUTO_INCREMENT,
  aluno_idaluno INT NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  vencimento DATE NOT NULL,
  pago BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (idmensalidade),
  CONSTRAINT fk_mensalidade_aluno FOREIGN KEY (aluno_idaluno)
    REFERENCES aluno (idaluno)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
