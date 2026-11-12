-- =====================================================================
-- DIM0114 - Banco de Dados / DIMAp - UFRN
-- Professor Marcus Terra
--
-- ATIVIDADE DE NORMALIZACAO - Simulado Eleitoral de Natal/RN
--
-- Alunos:
-- Luiz Renan da Silva Pontes - 20250031601
-- Pedro Lúcio de Azevedo - 20250036831
-- =====================================================================

-- =====================================================================
-- ETAPA 1 E 2: DIAGNÓSTICO E DEPENDÊNCIAS FUNCIONAIS
-- =====================================================================
-- 1FN: As colunas 'mesarios' e 'coligacao' violam a 1FN por serem multivaloradas.
--      Enquanto a coluna 'mesariios' tem os nomes separados por ponto e vírgula,
--      a coluna de 'coligacao' tem o nome dos partidos separados por '/'.
--
-- 2FN: A violação ocorre porque há atributos não chave que dependem parcialmente
--      da chave primária (titulo_eleitor, cargo), sendo elas:
--      titulo_eleitor -> nome_eleitor, nascimento_eleitor, zona, secao
--
-- 3FN: Violação por dependência transitiva, que diz que um atributo não chave não
--      pode depender de outro atributo não chave. Ocorre em:
--      (zona, secao) -> local_nome
--      local_nome -> local_endereco, local_bairro, municipio, uf
--      numero_partido -> sigla_partido, nome_partido
--      numero_candidato -> nome_candidato, numero_partido
--
-- Consegui identificar 4 inconsistências, que são:
--      1º - A idade do eleitor 1009 (Heitor Vale), na linha do voto para Prefeito,
--           o nascimento é '1998-04-12', já na linha do voto para Vereador, está 
--           '1989-04-12'.
--      2º - O nome do partido PRN aparece como 'Partido da Renovacao Nacional'
--           e como 'Partido de Renovacao Nacional'.
--      3º - O nome do candidato 30555 em algumas linhas está como 'Vitor Hollanda',
--           e na linha do eleitor 1014 ele aparece como 'Victor Hollanda'.
--      4º - Endereço do local de votação da escola Winston Churchill aparece 
--           registrada como 'Av. Rio Branco, 500' em algumas linhas e 'Avenida Rio Branco, 
--           500' em outras.


-- =====================================================================
-- ETAPAS 3 E 4: PROJETO E CRIAÇÃO DO ESQUEMA
-- =====================================================================

CREATE TABLE local_votacao (
    local_nome     VARCHAR(60) PRIMARY KEY,
    local_endereco VARCHAR(80) NOT NULL,
    local_bairro   VARCHAR(40) NOT NULL,
    municipio      VARCHAR(40) NOT NULL,
    uf             CHAR(2)     NOT NULL
);

CREATE TABLE secao (
    zona       CHAR(2)     NOT NULL,
    secao      CHAR(4)     NOT NULL,
    local_nome VARCHAR(60) NOT NULL,
    PRIMARY KEY (zona, secao),
    FOREIGN KEY (local_nome) REFERENCES local_votacao(local_nome)
);

CREATE TABLE mesario (
    zona         CHAR(2)     NOT NULL,
    secao        CHAR(4)     NOT NULL,
    nome_mesario VARCHAR(60) NOT NULL,
    PRIMARY KEY (zona, secao, nome_mesario),
    FOREIGN KEY (zona, secao) REFERENCES secao(zona, secao)
);

-- Colocar os outros create table abaixo viuss (obs: lembrar de seguir o padrão de nomeclatura das ETAPAS 1 E 2)


-- =====================================================================
-- ETAPA 5: MIGRAÇÃO
-- =====================================================================

--Povoando local_votacao
INSERT INTO local_votacao (local_nome, local_endereco, local_bairro, municipio, uf)
SELECT DISTINCT 
    local_nome, 
    REPLACE(local_endereco, 'Avenida', 'Av.'),
    local_bairro, 
    municipio, 
    uf
FROM votacao_bruta;

-- Povoando secao
INSERT INTO secao (zona, secao, local_nome)
SELECT DISTINCT 
    zona, 
    secao, 
    local_nome
FROM votacao_bruta;

-- Povoando mesario
INSERT INTO mesario (zona, secao, nome_mesario) VALUES
    ('Z1', 'S101', 'Ana Paula Vilar'),
    ('Z1', 'S101', 'Bruno Dias'),
    ('Z1', 'S101', 'Carla Nunes'),
    ('Z1', 'S102', 'Diego Lima'),
    ('Z1', 'S102', 'Elisa Ramos'),
    ('Z1', 'S103', 'Fabio Rocha'),
    ('Z1', 'S103', 'Gisele Antunes'),
    ('Z1', 'S103', 'Hugo Castro'),
    ('Z2', 'S201', 'Iara Melo'),
    ('Z2', 'S201', 'Joao Beltrao');

-- colocar os outros inserts abaixo viussss


-- =====================================================================
-- ETAPAS 6, 7 E 8: TRIGEM, CONSULTAS E O QUE FALTOU
-- =====================================================================

-- PERGUNTA 1: Tem resposta.

SELECT zona, secao, nome_mesario 
FROM mesario 
ORDER BY zona, secao, nome_mesario;

-- PERGUNTA 2: Tem resposta

SELECT s.local_nome, COUNT(m.nome_mesario) AS qtd_mesarios
FROM secao s
JOIN mesario m ON s.zona = m.zona AND s.secao = m.secao
GROUP BY s.local_nome;

-- PERGUNTA 3: Não tem resposta

-- JUSTIFICATIVA: Como não há registro de todos os eleitores aptos, mas somente daqueles que foram
-- votar na base de votação bruta, então não tem como dizer a idade média dos aptos, apenas dos que
-- foram votar.

-- PERGUNTA 4: Tem resposta

SELECT local_nome, local_endereco 
FROM local_votacao;

-- PERGUNTA 5: Não tem resposta

-- JUSTIFICATIVA: Não tem como saber pois na base lançada na tabela de votação bruta só consta os
-- dados dos candidatos que receberam pelo menos um voto, já que não tem como cadastrar um candidato
-- sem dar um voto para ele (um dos problemas de estruturar os dados dessa forma).

-- PERGUNTA 6: Tem resposta

SELECT DISTINCT nome_candidato 
FROM candidato;

-- PERGUNTA 7: Tem resposta

SELECT p.nome_partido, COUNT(v.titulo_eleitor) AS total_votos
FROM partido p
JOIN candidato c ON p.numero_partido = c.numero_partido
JOIN voto v ON c.numero_candidato = v.numero_candidato
GROUP BY p.nome_partido;

-- PERGUNTA 8: Tem resposta

SELECT COUNT(DISTINCT titulo_eleitor) AS total_comparecimento 
FROM eleitor;

-- PERGUNTA 9: Tem resposta

SELECT v.cargo, c.nome_candidato, p.sigla_partido, COUNT(v.titulo_eleitor) AS total_votos
FROM voto v
JOIN candidato c ON v.numero_candidato = c.numero_candidato
JOIN partido p ON c.numero_partido = p.numero_partido
GROUP BY v.cargo, c.nome_candidato, p.sigla_partido
ORDER BY v.cargo, total_votos DESC;

-- demais perguntas...
-- obs: eu respondi as perguntas com base nos nomes da tabela de votação bruta tlgd, então é bom mantê-los