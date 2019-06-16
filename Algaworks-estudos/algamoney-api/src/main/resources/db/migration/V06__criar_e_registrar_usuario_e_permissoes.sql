CREATE TABLE usuario (
	codigo BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    ativo BIT NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO usuario(nome, email, senha) VALUES ('Administrador', 'paulindf@gmail.com', '$2a$10$Y6lSvFcqWw0hSwDrwqZxbubgH1mWfjWQeW3IhtN/6b6NnnslMVwcG');
INSERT INTO usuario(nome, email, senha) VALUES ('Paulo da Silva Rita', 'paulindf@psr.com', '$2a$10$Y6lSvFcqWw0hSwDrwqZxbubgH1mWfjWQeW3IhtN/6b6NnnslMVwcG');
INSERT INTO usuario(nome, email, senha) VALUES ('Teste', 'teste@psr.com', '$2a$10$SR/cpaLqq6RrBniT84U3J.jKRawWZecl8jNZYpOMo1nBKFQFrkqIW');

CREATE TABLE permissao (
	codigo BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO PERMISSAO (DESCRICAO)
SELECT
    CONCAT(A.DESCRICAO, '_', B.DESCRICAO) AS DESCRICAO
FROM
	(
		SELECT 'CADASTRAR' AS DESCRICAO UNION
		SELECT 'EDITAR' AS DESCRICAO UNION
		SELECT 'REMOVER' AS DESCRICAO UNION
		SELECT 'CONSULTAR' AS DESCRICAO
	) A,
    (
		SELECT 'CATEGORIA' AS DESCRICAO UNION
		SELECT 'PESSOA' AS DESCRICAO UNION
		SELECT 'LANCAMENTO' AS DESCRICAO UNION
		SELECT 'USUARIO' AS DESCRICAO
	) B
ORDER BY 1
;

CREATE TABLE usuario_permissao (
	codigo_usuario BIGINT(20) NOT NULL,
    codigo_permissao BIGINT(20) NOT NULL,
    PRIMARY KEY(codigo_usuario, codigo_permissao),
    FOREIGN KEY(codigo_usuario) REFERENCES usuario(codigo),
    FOREIGN KEY(codigo_permissao) REFERENCES permissao(codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO USUARIO_PERMISSAO (
	CODIGO_USUARIO
    ,CODIGO_PERMISSAO
)
SELECT
	B.CODIGO AS CODIGO_USUARIO
	,A.CODIGO AS CODIGO_PERMISSAO
FROM
	PERMISSAO A,
    USUARIO B
WHERE
	B.NOME IN ('Administrador', 'Paulo da Silva Rita')
UNION
SELECT
	B.CODIGO AS CODIGO_USUARIO
	,A.CODIGO AS CODIGO_PERMISSAO
FROM
	PERMISSAO A,
    USUARIO B
WHERE
	A.DESCRICAO LIKE 'CONSULTAR_%'
AND B.NOME = 'Teste'
;

#DROP TABLE USUARIO_PERMISSAO, PERMISSAO, USUARIO;