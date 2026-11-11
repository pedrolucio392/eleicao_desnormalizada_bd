-- =====================================================================
-- DIM0114 - Banco de Dados / DIMAp - UFRN
-- Professor Marcus Terra
--
-- ATIVIDADE DE NORMALIZACAO - Simulado Eleitoral de Natal/RN
--
-- Este script cria UMA unica tabela: votacao_bruta, sem nenhuma
-- normalizacao. E tudo o que voce tem. Tudo o que for construido a
-- partir daqui sai dela - e o que nao estiver aqui dentro, nao existe.
--
-- Os dados sao ficticios. Numa eleicao real o voto e sigiloso e uma
-- tabela ligando eleitor a candidato nao poderia existir - o que ja e,
-- por si so, um bom exemplo de requisito que o modelo precisa respeitar.
--
-- Script portatil: roda em MySQL, PostgreSQL e SQLite sem alteracao.
-- =====================================================================

DROP TABLE IF EXISTS votacao_bruta;


-- =====================================================================
-- A TABELA UNICA
--
--    Uma linha por eleitor e por cargo votado.
--    Chave primaria: (titulo_eleitor, cargo)
-- =====================================================================

CREATE TABLE votacao_bruta (
  titulo_eleitor     CHAR(4)      NOT NULL,
  cargo              VARCHAR(10)  NOT NULL,
  nome_eleitor       VARCHAR(60)  NOT NULL,
  nascimento_eleitor DATE         NOT NULL,
  zona               CHAR(2)      NOT NULL,
  secao              CHAR(4)      NOT NULL,
  local_nome         VARCHAR(60)  NOT NULL,
  local_endereco     VARCHAR(80)  NOT NULL,
  local_bairro       VARCHAR(40)  NOT NULL,
  municipio          VARCHAR(40)  NOT NULL,
  uf                 CHAR(2)      NOT NULL,
  mesarios           VARCHAR(120) NOT NULL,
  data_voto          DATE         NOT NULL,
  hora_voto          CHAR(5)      NOT NULL,
  numero_candidato   VARCHAR(5)   NOT NULL,
  nome_candidato     VARCHAR(60)  NOT NULL,
  numero_partido     CHAR(2)      NOT NULL,
  sigla_partido      VARCHAR(6)   NOT NULL,
  nome_partido       VARCHAR(60)  NOT NULL,
  coligacao          VARCHAR(60)  NOT NULL,
  PRIMARY KEY (titulo_eleitor, cargo)
);

INSERT INTO votacao_bruta (titulo_eleitor, cargo, nome_eleitor, nascimento_eleitor,
  zona, secao, local_nome, local_endereco, local_bairro, municipio, uf, mesarios,
  data_voto, hora_voto, numero_candidato, nome_candidato, numero_partido,
  sigla_partido, nome_partido, coligacao) VALUES
  ('1001', 'Prefeito', 'Alice Moreira', '1996-03-14', 'Z1', 'S101', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Ana Paula Vilar;Bruno Dias;Carla Nunes', '2026-10-04', '08:12', '10', 'Marta Queiroz', '10', 'PRN', 'Partido da Renovacao Nacional', 'PRN / PDS'),
  ('1001', 'Vereador', 'Alice Moreira', '1996-03-14', 'Z1', 'S101', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Ana Paula Vilar;Bruno Dias;Carla Nunes', '2026-10-04', '08:12', '10111', 'Rafael Monte', '10', 'PRN', 'Partido da Renovacao Nacional', 'PRN / PDS'),
  ('1002', 'Prefeito', 'Bento Siqueira', '1988-07-02', 'Z1', 'S101', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Ana Paula Vilar;Bruno Dias;Carla Nunes', '2026-10-04', '08:31', '10', 'Marta Queiroz', '10', 'PRN', 'Partido de Renovacao Nacional', 'PRN / PDS'),
  ('1002', 'Vereador', 'Bento Siqueira', '1988-07-02', 'Z1', 'S101', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Ana Paula Vilar;Bruno Dias;Carla Nunes', '2026-10-04', '08:31', '10111', 'Rafael Monte', '10', 'PRN', 'Partido da Renovacao Nacional', 'PRN / PDS'),
  ('1003', 'Prefeito', 'Clara Pontes', '2001-11-23', 'Z1', 'S101', 'Escola Estadual Winston Churchill', 'Avenida Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Ana Paula Vilar;Bruno Dias;Carla Nunes', '2026-10-04', '09:05', '20', 'Olavo Bastos', '20', 'PUC', 'Partido Uniao Cidada', 'PUC'),
  ('1003', 'Vereador', 'Clara Pontes', '2001-11-23', 'Z1', 'S101', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Ana Paula Vilar;Bruno Dias;Carla Nunes', '2026-10-04', '09:05', '20333', 'Tiago Albuquerque', '20', 'PUC', 'Partido Uniao Cidada', 'PUC'),
  ('1004', 'Prefeito', 'Davi Leitao', '1979-01-30', 'Z1', 'S101', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Ana Paula Vilar;Bruno Dias;Carla Nunes', '2026-10-04', '09:48', '30', 'Paula Serrano', '30', 'MVP', 'Movimento Verde Popular', 'MVP / FTP'),
  ('1004', 'Vereador', 'Davi Leitao', '1979-01-30', 'Z1', 'S101', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Ana Paula Vilar;Bruno Dias;Carla Nunes', '2026-10-04', '09:48', '30555', 'Vitor Hollanda', '30', 'MVP', 'Movimento Verde Popular', 'MVP / FTP'),
  ('1006', 'Prefeito', 'Eva Marinho', '1999-09-08', 'Z1', 'S102', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Diego Lima;Elisa Ramos', '2026-10-04', '08:20', '10', 'Marta Queiroz', '10', 'PRN', 'Partido da Renovacao Nacional', 'PRN / PDS'),
  ('1006', 'Vereador', 'Eva Marinho', '1999-09-08', 'Z1', 'S102', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Diego Lima;Elisa Ramos', '2026-10-04', '08:20', '10111', 'Rafael Monte', '10', 'PRN', 'Partido da Renovacao Nacional', 'PRN / PDS'),
  ('1007', 'Prefeito', 'Felipe Torres', '1985-12-11', 'Z1', 'S102', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Diego Lima;Elisa Ramos', '2026-10-04', '08:55', '20', 'Olavo Bastos', '20', 'PUC', 'Partido Uniao Cidada', 'PUC'),
  ('1007', 'Vereador', 'Felipe Torres', '1985-12-11', 'Z1', 'S102', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Diego Lima;Elisa Ramos', '2026-10-04', '08:55', '20444', 'Ursula Bezerra', '20', 'PUC', 'Partido Uniao Cidada', 'PUC'),
  ('1008', 'Prefeito', 'Gabi Coelho', '2003-02-27', 'Z1', 'S102', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Diego Lima;Elisa Ramos', '2026-10-04', '10:11', '30', 'Paula Serrano', '30', 'MVP', 'Movimento Verde Popular', 'MVP / FTP'),
  ('1008', 'Vereador', 'Gabi Coelho', '2003-02-27', 'Z1', 'S102', 'Escola Estadual Winston Churchill', 'Avenida Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Diego Lima;Elisa Ramos', '2026-10-04', '10:11', '30555', 'Vitor Hollanda', '30', 'MVP', 'Movimento Verde Popular', 'MVP / FTP'),
  ('1009', 'Prefeito', 'Heitor Vale', '1998-04-12', 'Z1', 'S102', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Diego Lima;Elisa Ramos', '2026-10-04', '10:40', '10', 'Marta Queiroz', '10', 'PRN', 'Partido de Renovacao Nacional', 'PRN / PDS'),
  ('1009', 'Vereador', 'Heitor Vale', '1989-04-12', 'Z1', 'S102', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Diego Lima;Elisa Ramos', '2026-10-04', '10:40', '10111', 'Rafael Monte', '10', 'PRN', 'Partido da Renovacao Nacional', 'PRN / PDS'),
  ('1010', 'Prefeito', 'Ines Barroso', '1991-06-05', 'Z1', 'S102', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Diego Lima;Elisa Ramos', '2026-10-04', '11:02', '20', 'Olavo Bastos', '20', 'PUC', 'Partido Uniao Cidada', 'PUC'),
  ('1010', 'Vereador', 'Ines Barroso', '1991-06-05', 'Z1', 'S102', 'Escola Estadual Winston Churchill', 'Av. Rio Branco, 500', 'Cidade Alta', 'Natal', 'RN', 'Diego Lima;Elisa Ramos', '2026-10-04', '11:02', '20333', 'Tiago Albuquerque', '20', 'PUC', 'Partido Uniao Cidada', 'PUC'),
  ('1011', 'Prefeito', 'Jonas Prado', '1976-10-21', 'Z1', 'S103', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Fabio Rocha;Gisele Antunes;Hugo Castro', '2026-10-04', '08:44', '30', 'Paula Serrano', '30', 'MVP', 'Movimento Verde Popular', 'MVP / FTP'),
  ('1011', 'Vereador', 'Jonas Prado', '1976-10-21', 'Z1', 'S103', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Fabio Rocha;Gisele Antunes;Hugo Castro', '2026-10-04', '08:44', '30555', 'Vitor Hollanda', '30', 'MVP', 'Movimento Verde Popular', 'MVP / FTP'),
  ('1012', 'Prefeito', 'Keila Martins', '2000-08-17', 'Z1', 'S103', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Fabio Rocha;Gisele Antunes;Hugo Castro', '2026-10-04', '09:17', '10', 'Marta Queiroz', '10', 'PRN', 'Partido da Renovacao Nacional', 'PRN / PDS'),
  ('1012', 'Vereador', 'Keila Martins', '2000-08-17', 'Z1', 'S103', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Fabio Rocha;Gisele Antunes;Hugo Castro', '2026-10-04', '09:17', '40777', 'Xavier Lopes', '40', 'PDS', 'Partido do Desenvolvimento Solidario', 'PRN / PDS'),
  ('1013', 'Prefeito', 'Lauro Guedes', '1982-03-03', 'Z1', 'S103', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Fabio Rocha;Gisele Antunes;Hugo Castro', '2026-10-04', '13:25', '20', 'Olavo Bastos', '20', 'PUC', 'Partido Uniao Cidada', 'PUC'),
  ('1013', 'Vereador', 'Lauro Guedes', '1982-03-03', 'Z1', 'S103', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Fabio Rocha;Gisele Antunes;Hugo Castro', '2026-10-04', '13:25', '20444', 'Ursula Bezerra', '20', 'PUC', 'Partido Uniao Cidada', 'PUC'),
  ('1014', 'Prefeito', 'Mirna Castro', '1995-07-29', 'Z1', 'S103', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Fabio Rocha;Gisele Antunes;Hugo Castro', '2026-10-04', '14:08', '30', 'Paula Serrano', '30', 'MVP', 'Movimento Verde Popular', 'MVP / FTP'),
  ('1014', 'Vereador', 'Mirna Castro', '1995-07-29', 'Z1', 'S103', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Fabio Rocha;Gisele Antunes;Hugo Castro', '2026-10-04', '14:08', '30555', 'Victor Hollanda', '30', 'MVP', 'Movimento Verde Popular', 'MVP / FTP'),
  ('1016', 'Prefeito', 'Nelson Aragao', '1987-05-25', 'Z2', 'S201', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Iara Melo;Joao Beltrao', '2026-10-04', '08:09', '10', 'Marta Queiroz', '10', 'PRN', 'Partido da Renovacao Nacional', 'PRN / PDS'),
  ('1016', 'Vereador', 'Nelson Aragao', '1987-05-25', 'Z2', 'S201', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Iara Melo;Joao Beltrao', '2026-10-04', '08:09', '10111', 'Rafael Monte', '10', 'PRN', 'Partido de Renovacao Nacional', 'PRN / PDS'),
  ('1017', 'Prefeito', 'Olivia Bastos', '1994-02-14', 'Z2', 'S201', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Iara Melo;Joao Beltrao', '2026-10-04', '09:33', '20', 'Olavo Bastos', '20', 'PUC', 'Partido Uniao Cidada', 'PUC'),
  ('1017', 'Vereador', 'Olivia Bastos', '1994-02-14', 'Z2', 'S201', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Iara Melo;Joao Beltrao', '2026-10-04', '09:33', '20333', 'Tiago Albuquerque', '20', 'PUC', 'Partido Uniao Cidada', 'PUC'),
  ('1018', 'Prefeito', 'Pedro Lacerda', '2002-06-30', 'Z2', 'S201', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Iara Melo;Joao Beltrao', '2026-10-04', '10:52', '10', 'Marta Queiroz', '10', 'PRN', 'Partido da Renovacao Nacional', 'PRN / PDS'),
  ('1018', 'Vereador', 'Pedro Lacerda', '2002-06-30', 'Z2', 'S201', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Iara Melo;Joao Beltrao', '2026-10-04', '10:52', '20444', 'Ursula Bezerra', '20', 'PUC', 'Partido Uniao Cidada', 'PUC'),
  ('1019', 'Prefeito', 'Quiteria Reis', '1981-09-16', 'Z2', 'S201', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Iara Melo;Joao Beltrao', '2026-10-04', '12:14', '30', 'Paula Serrano', '30', 'MVP', 'Movimento Verde Popular', 'MVP / FTP'),
  ('1019', 'Vereador', 'Quiteria Reis', '1981-09-16', 'Z2', 'S201', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Iara Melo;Joao Beltrao', '2026-10-04', '12:14', '40777', 'Xavier Lopes', '40', 'PDS', 'Partido do Desenvolvimento Solidario', 'PRN / PDS'),
  ('1020', 'Prefeito', 'Renan Sobral', '1997-11-04', 'Z2', 'S201', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Iara Melo;Joao Beltrao', '2026-10-04', '15:40', '20', 'Olavo Bastos', '20', 'PUC', 'Partido Uniao Cidada', 'PUC'),
  ('1020', 'Vereador', 'Renan Sobral', '1997-11-04', 'Z2', 'S201', 'Instituto Padre Miguelinho', 'Rua Jundiai, 120', 'Tirol', 'Natal', 'RN', 'Iara Melo;Joao Beltrao', '2026-10-04', '15:40', '20333', 'Tiago Albuquerque', '20', 'PUC', 'Partido Uniao Cidada', 'PUC');


-- =====================================================================
-- 3. CONFERENCIA
-- =====================================================================
-- SELECT COUNT(*) FROM votacao_bruta;                   -- esperado: 36
-- SELECT COUNT(DISTINCT titulo_eleitor) FROM votacao_bruta;  -- esperado: 18

-- FIM DO SCRIPT
